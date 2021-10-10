# OH BOY I SURE DO LOVE SCHEDULING JOBS
import schedule
import threading
import time
import sys
import json
from datetime import datetime

import sqlite3 as sql

import graphanalyzer
import helpers
import paymentreducer
from model import models

with open('config.json') as f:
    config = json.loads(f.read())

# Actually try to move the team in the db and
# Return a string describing the team's move


def team_attempt_move(team_id):
    process_log = ""
    # Load team.
    t = models.Team()
    t.load(team_id)
    flns = paymentreducer.get_funding_list(
        team_id, helpers.get_game_day()-1, False)
    fl = paymentreducer.get_funding_list(
        team_id, helpers.get_game_day()-1, True)

    # Check for best-funded succesful path
    new_loc = t.current_location_id
    biggest_funding = -1
    was_sabotaged = False
    for k, v in flns.items():
        le = models.LocationEdge()
        le.load(k)
        if v >= le.weight and v > biggest_funding:
            new_loc = le.end_location_id
            biggest_funding = v
            if fl[k] < le.weight:
                was_sabotaged = True
            else:
                was_sabotaged = False

    if biggest_funding == -1:
        process_log = "The {} didn't raise enough to book passage anywhere...".format(
            t.name)
    else:
        l = models.Location()
        l.load(new_loc)
        if was_sabotaged:
            process_log = "The {} tried to travel to {}, but someone sabotaged them and they were stopped by the Black Cats!".format(
                t.name, l.name
            )
        else:
            t.current_location_id = new_loc
            t.update()
            process_log = "The {} have successfully reached {}!".format(
                t.name, l.name)

    models.save()
    return process_log + "\n"


def update_shares():
    players = models.Player_list()
    players.load_all()
    for player in players.items:
        days_since_active = helpers.get_game_day() - player.last_active_day
        if days_since_active < len(config['afk_falloff']):
            player.shares = config['afk_falloff'][days_since_active]
        else:
            player.shares = 1
        player.update()
    models.save()


def pay_players():
    teams = models.Team_list()
    teams.custom_load("team_id > ?", (0,))
    for t in teams.items:
        # load all the players
        players = models.Player_list()
        # Still the dumb Loadall HACK
        players.custom_load("team_id = ?", (t.team_id,))

        total_team_shares = sum([p.shares for p in players.items])
        share_value = config['daily_team_coins'] / total_team_shares
        # pay 'em
        for player in players.items:
            # add daily salary
            player.coins += int(share_value * player.shares)
            # get  THIS PLAYER's payments from TODAY for THIS PLAYER's TEAM that
            # WEREN'T put toward the current location (for refunds)
            models.c.execute("SELECT SUM(amount) FROM Payment p LEFT JOIN LocationEdge le ON(p.location_edge = le.edge_id) WHERE player_id = ? AND team_id = ? AND time = ? AND end_location_id != ?",
                             (player.player_id, player.team_id, helpers.get_game_day()-1, t.current_location_id))

            refund = models.c.fetchone()[0]
            if refund is None:
                refund = 0
            player.coins += int(refund * (config['refund_percentage'] / 100))

            player.update()
    models.save()


def next_location_table(team_id):
    t = graphanalyzer.get_next_location_list(team_id)
    tab = []
    tab.append("```\n")
    for k, v in t.items():
        l = models.Location()
        l.custom_load("name = ?", (k,))
        tab.append("{}: {} coins, at least {}km from the goal\n".format(
            k, v, graphanalyzer.dijkstra(graphanalyzer.graph, l.location_id, 0)))
    tab.append("```")
    return ''.join(tab)


def on_new_day():
    if not config['game_ongoing']:
        return
    print("A new day dawns...")
    print("Moving teams")
    # Each team tries to move to a new location!
    progress_log = []
    for i in range(1, 4):
        progress_log.append(team_attempt_move(i))
    progress_log.append("\n")
    # Send coins to players
    print("Updating player shares")
    update_shares()
    print("Paying players")
    pay_players()

    # Send daily message to progress-announcements channel
    with sql.connect('internal.sqlite3', timeout=30) as conn:
        msg = []
        msg.append(
            "A new day has begun! Welcome to day **{}**!\n".format(helpers.get_game_day()))
        msg.append("Here's what's happened since yesterday:\n")
        msg.append("```\n")
        if helpers.get_game_day() == 1:
            msg.append("The race began! All teams are currently in London\n")
        else:
            msg.append("\n".join(progress_log))
        msg.append("```\n")

        # FIXME hardcoded team names...
        msg.append(
            "**Argent Boars**, here are your destination options for today:\n")
        msg.append(next_location_table(1))
        msg.append("And for you, **Azure Wolves**:\n")
        msg.append(next_location_table(2))
        msg.append("Finally, **Crimson Stallions**:\n")
        msg.append(next_location_table(3))
        msg.append(
            "You've all already received your salaries and refunds, so get booking and good luck!")
        c = conn.cursor()
        log = models.Log()
        log.date = str(datetime.now())
        log.game_day = helpers.get_game_day()
        log.msg = ''.join(msg)
        log.target_channel_id = config['channels']['progress-announcements']
        # I hate this but it's better than my hackosaurus workaround
        c.execute("INSERT INTO Log(date, game_day, msg, sent, target_channel_id) VALUES (?,?,?,?,?)",
                  (log.date, log.game_day, log.msg, log.sent, log.target_channel_id))

        conn.commit()


def ten_minute_warning():
    if not config['game_ongoing']:
        return
    l = models.Log()
    l.date = str(datetime.now())
    l.game_day = helpers.get_game_day()
    l.msg = "10 minutes remaining in the day! Get those payments in!!!"
    l.target_channel_id = config['channels']['progress-announcements']
    l.insert()
    models.save()


def run_jobs():
    while True:
        schedule.run_pending()
        time.sleep(1)
        sys.stdout.flush()


schedule.every().hour.at(':00').do(on_new_day)
schedule.every().hour.at(':50').do(ten_minute_warning)

# FOR TESTING
# schedule.every(30).seconds.do(on_new_day)
# schedule.every(3).seconds.do(ten_minute_warning)

job_thread = threading.Thread(target=run_jobs, daemon=True)
print("Starting scheduled jobs")
job_thread.start()
# run_jobs()

# if __name__ == "__main__":
#     while True:
#         pass

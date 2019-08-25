# OH BOY I SURE DO LOVE SCHEDULING JOBS
import schedule
import threading
from datetime import datetime
import time
import sys
import json
import sqlite3 as sql

import models
import paymentreducer
import graphanalyzer
import helpers

with open('config.json') as f:
    config = json.loads(f.read())

# Actually try to move the team in the db and
# Return a string describing the team's move
# TODO
def team_attempt_move(team_id):
    return " "

# TODO This
def pay_players():
    # load all the players
    # players = models.Player_list()
    # # pay 'em
    # for player in players:
    #     pass
    pass


def next_location_table(team_id):
    t = graphanalyzer.get_next_location_list(team_id)
    tab = []
    tab.append("```\n")
    for k,v in t.items():
        tab.append("{}: {} coins\n".format(k, v))
    tab.append("```")
    return ''.join(tab)


def on_new_day():
    print("A new day dawns...")
    # Each team tries to move to a new location!
    progress_log = []
    for i in range(3):
        progress_log.append(team_attempt_move(i))
    progress_log.append("\n")
    # Send coins to players
    pay_players()

    # Send daily message to progress-announcements channel
    with sql.connect('internal.sqlite3') as conn:
        msg = []
        msg.append("A new day has begun! Welcome to day **{}**!\n".format(helpers.get_game_day()))
        msg.append("Here's what's happened since yesterday:\n")
        msg.append("```\n")
        if helpers.get_game_day() == 1:
            msg.append("The race began! All teams are currently in London\n")
        else:
            msg.append("\n".join(progress_log))
        msg.append("```\n")

        # TODO total distances
        # FIXME hardcoded team names...
        msg.append("**Argent Boars**, here are your destination options for today:\n")
        msg.append(next_location_table(1))
        msg.append("And for you, **Azure Wolves**:\n")
        msg.append(next_location_table(2))
        msg.append("Finally, **Crimson Stallions**:\n")
        msg.append(next_location_table(3))
        msg.append("Good luck!")
        c = conn.cursor()
        log = models.Log()
        log.date = str(datetime.now())
        log.game_day = helpers.get_game_day()
        log.msg = ''.join(msg)
        log.target_channel_id = config['channels']['test']
        # I hate this but it's better than my hackosaurus workaround
        c.execute("INSERT INTO Log(date, game_day, msg, sent, target_channel_id) VALUES (?,?,?,?,?)",
            (log.date, log.game_day, log.msg, log.sent, log.target_channel_id))

        conn.commit()

def ten_minute_warning():
    l = models.Log()
    l.date = str(datetime.now())
    l.game_day = helpers.get_game_day()
    l.msg = "10 minutes remaining in the day! Get those payments in!!!"
    l.target_channel_id = config['channels']['test']
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
# schedule.every(30).seconds.do(ten_minute_warning)

job_thread = threading.Thread(target=run_jobs, daemon=True)
print("Starting scheduled jobs")
job_thread.start()
#run_jobs()

# if __name__ == "__main__":
#     while True:
#         pass
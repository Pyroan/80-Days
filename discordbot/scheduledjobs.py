# OH BOY I SURE DO LOVE SCHEDULING JOBS
import schedule
import threading
from datetime import datetime
import time
import sys
import models
import json
import sqlite3 as sql

import paymentreducer

with open('config.json') as f:
    config = json.loads(f.read())

def team_attempt_move(team_id):
    pass

def pay_players():
    pass

def on_new_day():
    print("A new day dawns...")
    # Each team tries to move to a new location!
    for i in range(3):
        team_attempt_move(i)
    # Send coins to players
    pay_players()
    # Send daily message to progress-announcements channel
    with sql.connect('internal.sqlite3') as conn:
        c = conn.cursor()
        log = models.Log()
        log.date = str(datetime.now())
        log.game_day = 0
        log.msg = ":notes: It's a brand new day and my logging works :notes:"
        log.target_channel_id = 614344478601510912
        # I hate this but it's better than my hackosaurus workaround
        c.execute("INSERT INTO Log(date, game_day, msg, sent, target_channel_id) VALUES (?,?,?,?,?)",
            (log.date, log.game_day, log.msg, log.sent, log.target_channel_id))

        # Send daily message to each team (potentially can skip)
        conn.commit()


def run_jobs():
    while True:
        schedule.run_pending()
        time.sleep(1)
        sys.stdout.flush()

# schedule.every().hour.do(on_new_day)
# schedule.every().minute.do(on_new_day)

job_thread = threading.Thread(target=run_jobs, daemon=True)
print("Starting scheduled jobs")
job_thread.start()

if __name__ == "__main__":
    while True:
        pass
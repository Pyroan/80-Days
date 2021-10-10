import sqlite3 as sql
import threading

# FIXME LITERALLY ANY ERROR HANDLING SMH
# Also thread safety.
conn = sql.connect('model/internal.sqlite3', check_same_thread=False)
c = conn.cursor()
lock = threading.Lock()


def save():
    lock.acquire()
    conn.commit()
    lock.release()


class Location:
    location_id: int
    name: str

    def load(self, id):
        lock.acquire()
        c.execute("SELECT * FROM Location WHERE location_id = ?",  (str(id),))
        row = c.fetchone()
        lock.release()
        self.location_id = row[0]
        self.name = row[1]

    def custom_load(self, where: str, values: tuple):
        lock.acquire()
        c.execute("SELECT * FROM Location WHERE " + where, values)
        row = c.fetchone()
        lock.release()
        self.location_id = row[0]
        self.name = row[1]

    def insert(self):
        lock.acquire()
        c.execute("INSERT INTO Location(name) VALUES (?)",
                  (self.name))
        lock.release()

    def update(self):
        lock.acquire()
        c.execute("UPDATE Location SET name = ? WHERE location_id = ?",
                  (self.name, self.location_id))
        lock.release()

    def delete(self):
        lock.acquire()
        c.execute("DELETE FROM Location WHERE location_id = ?",
                  str(self.location_id))
        lock.release()


class Location_list:
    items = []

    def custom_load(self, where: str, values: tuple):
        self.items = []
        lock.acquire()
        c.execute("SELECT * FROM Location WHERE " + where, values)
        rows = c.fetchall()
        lock.release()
        for item in rows:
            l = Location()
            l.location_id = item[0]
            l.name = item[1]
            self.items.append(l)


class LocationEdge:
    edge_id: int
    start_location_id: int
    end_location_id: int
    weight: int

    def load(self, id):
        lock.acquire()
        c.execute("SELECT * FROM LocationEdge WHERE edge_id = ?", (str(id),))
        row = c.fetchone()
        lock.release()
        self.edge_id = row[0]
        self.start_location_id = row[1]
        self.end_location_id = row[2]
        self.weight = row[3]

    def custom_load(self, where: str, values: tuple):
        lock.acquire()
        c.execute("SELECT * FROM LocationEdge WHERE " + where, values)
        row = c.fetchone()
        lock.release()
        self.edge_id = row[0]
        self.start_location_id = row[1]
        self.end_location_id = row[2]
        self.weight = row[3]

    def insert(self):
        lock.acquire()
        c.execute("INSERT INTO LocationEdge(start_location_id, end_location_id, weight) VALUES (?,?,?)",
                  (self.start_location_id, self.end_location_id, self.weight))
        lock.release()

    def update(self):
        lock.acquire()
        c.execute("UPDATE LocationEdge SET start_location_id = ?, end_location_id = ?, weight = ? WHERE edge_id = ?",
                  (self.start_location_id, self.end_location_id, self.weight, self.edge_id))
        lock.release()

    def delete(self):
        lock.acquire()
        c.execute("DELETE FROM LocationEdge WHERE edge_id = ?",
                  str(self.edge_id))
        lock.release()


class LocationEdge_list:
    items = []

    def custom_load(self, where: str, values: tuple):
        self.items = []
        lock.acquire()
        c.execute("SELECT * FROM LocationEdge WHERE " + where, values)
        rows = c.fetchall()
        lock.release()
        for item in rows:
            l = LocationEdge()
            l.edge_id = item[0]
            l.start_location_id = item[1]
            l.end_location_id = item[2]
            l.weight = item[3]
            self.items.append(l)


class Log:
    log_id: int
    date: str
    game_day: int
    msg: str
    sent: int
    target_channel_id: int

    def __init__(self):
        self.sent = 0

    def load(self, id):
        lock.acquire()
        c.execute("SELECT * FROM Log WHERE log_id = ?",  (str(id),))
        row = c.fetchone()
        lock.release()
        self.log_id = row[0]
        self.date = row[1]
        self.game_day = row[2]
        self.msg = row[3]
        self.sent = row[4]
        self.target_channel_id = row[5]

    def custom_load(self, where: str, values: tuple):
        lock.acquire()
        c.execute("SELECT * FROM Log WHERE " + where, values)
        row = c.fetchone()
        lock.release()
        self.log_id = row[0]
        self.date = row[1]
        self.game_day = row[2]
        self.msg = row[3]
        self.sent = row[4]
        self.target_channel_id = row[5]

    def insert(self):
        lock.acquire()
        c.execute("INSERT INTO Log(date, game_day, msg, sent, target_channel_id) VALUES (?,?,?,?,?)",
                  (self.date, self.game_day, self.msg, self.sent, self.target_channel_id))
        lock.release()

    def update(self):
        lock.acquire()
        c.execute("UPDATE Log SET date = ?, game_day = ?, msg = ?, sent = ?, target_channel_id = ? WHERE log_id = ?",
                  (self.date, self.game_day, self.msg, self.sent, self.target_channel_id, self.log_id))
        lock.release()

    def delete(self):
        lock.acquire()
        c.execute("DELETE FROM Log WHERE log_id = ?", str(self.log_id))
        lock.release()


class Log_list:
    items = []

    def custom_load(self, where: str, values: tuple):
        self.items = []
        lock.acquire()
        c.execute("SELECT * FROM Log WHERE " + where, values)
        rows = c.fetchall()
        lock.release()
        for item in rows:
            l = Log()
            l.log_id = item[0]
            l.date = item[1]
            l.game_day = item[2]
            l.msg = item[3]
            l.sent = item[4]
            l.target_channel_id = item[5]
            self.items.append(l)


class Payment:
    payment_id: int
    player_id: int
    team_id: int
    amount: int
    location_edge: int
    time: int

    def load(self, id):
        lock.acquire()
        c.execute("SELECT * FROM Payment WHERE payment_id = ?",  (str(id),))
        row = c.fetchone()
        lock.release()
        self.payment_id = row[0]
        self.player_id = row[1]
        self.team_id = row[2]
        self.amount = row[3]
        self.location_edge = row[4]
        self.time = row[5]

    def custom_load(self, where: str, values: tuple):
        lock.acquire()
        c.execute("SELECT * FROM Team WHERE " + where, values)
        row = c.fetchone()
        lock.release()
        self.payment_id = row[0]
        self.player_id = row[1]
        self.team_id = row[2]
        self.amount = row[3]
        self.location_edge = row[4]
        self.time = row[5]

    def insert(self):
        lock.acquire()
        c.execute("INSERT INTO Payment(player_id, team_id, amount, location_edge, time) VALUES (?,?,?,?,?)",
                  (self.player_id, self.team_id, self.amount, self.location_edge, self.time))
        lock.release()

    def update(self):
        lock.acquire()
        c.execute("UPDATE Payment SET player_id = ?, team_id = ?, amount = ?, location_edge = ?, time = ? WHERE payment_id = ?",
                  (self.player_id, self.team_id, self.amount, self.location_edge, self.time, self.payment_id))
        lock.release()

    def delete(self):
        lock.acquire()
        c.execute("DELETE FROM Payment WHERE payment_id = ?",
                  str(self.payment_id))
        lock.release()


class Payment_list:
    items = []

    def custom_load(self, where: str, values: tuple):
        self.items = []
        lock.acquire()
        c.execute("SELECT * FROM Payment WHERE " + where, values)
        lock.release()
        rows = c.fetchall()
        for item in rows:
            p = Payment()
            p.payment_id = item[0]
            p.player_id = item[1]
            p.team_id = item[2]
            p.amount = item[3]
            p.location_edge = item[4]
            p.time = item[5]
            self.items.append(p)


# It's just easier this way.
class PaymentSummary:
    items = {}

    def load_payment_summary(self, day, team_id, show_sabotage):
        self.items = {}
        lock.acquire()
        if show_sabotage:
            c.execute("SELECT location_edge, SUM(amount) s, time FROM Payment WHERE time = ? AND team_id = ? GROUP BY location_edge",
                      (day, team_id,))
        else:
            c.execute("SELECT location_edge, SUM(amount) s, time FROM Payment WHERE time = ? AND team_id = ? AND amount > 0 GROUP BY location_edge",
                      (day, team_id,))
        rows = c.fetchall()
        lock.release()
        for item in rows:
            self.items[item[0]] = item[1]


class Player:
    player_id: int
    discord_id: str
    team_id: int
    coins: int
    last_active_day: int
    shares: int

    def __init__(self):
        self.player_id = -1

    def load(self, id):
        lock.acquire()
        c.execute("SELECT * FROM Player WHERE player_id = ?",  (str(id),))
        row = c.fetchone()
        lock.release()
        self.player_id = row[0]
        self.discord_id = row[1]
        self.team_id = row[2]
        self.coins = row[3]
        self.last_active_day = row[4]
        self.shares = row[5]

    def custom_load(self, where: str, values: tuple):
        lock.acquire()
        c.execute("SELECT * FROM Player WHERE " + where, values)
        row = c.fetchone()
        lock.release()
        self.player_id = row[0]
        self.discord_id = row[1]
        self.team_id = row[2]
        self.coins = row[3]
        self.last_active_day = row[4]
        self.shares = row[5]

    def insert(self):
        lock.acquire()
        c.execute("INSERT INTO Player(discord_id, team_id, coins, last_active_day, shares) VALUES (?,?,?,?,?)",
                  (self.discord_id, self.team_id, self.coins, self.last_active_day, self.shares))
        lock.release()

    def update(self):
        lock.acquire()
        c.execute("UPDATE Player SET discord_id = ?, team_id = ?, coins = ?, last_active_day = ?, shares = ? WHERE player_id = ?",
                  (self.discord_id, self.team_id, self.coins, self.last_active_day, self.shares, self.player_id))
        lock.release()

    def delete(self):
        lock.acquire()
        c.execute("DELETE FROM Player WHERE player_id = ?",
                  (str(self.player_id),))
        lock.release()


class Player_list:
    items = []

    def custom_load(self, where: str, values: tuple):
        self.items = []
        lock.acquire()
        c.execute("SELECT * FROM Player WHERE " + where, values)
        rows = c.fetchall()
        lock.release()
        for item in rows:
            p = Player()
            p.player_id = item[0]
            p.discord_id = item[1]
            p.team_id = item[2]
            p.coins = item[3]
            p.last_active_day = item[4]
            p.shares = item[5]
            self.items.append(p)

    def load_all(self):
        self.items = []
        lock.acquire()
        c.execute("SELECT * FROM Player")
        rows = c.fetchall()
        lock.release()
        for item in rows:
            p = Player()
            p.player_id = item[0]
            p.discord_id = item[1]
            p.team_id = item[2]
            p.coins = item[3]
            p.last_active_day = item[4]
            p.shares = item[5]
            self.items.append(p)


class Team:
    team_id: int
    name: str
    current_location_id: int

    def load(self, id):
        lock.acquire()
        c.execute("SELECT * FROM Team WHERE team_id = ?",  (str(id),))
        row = c.fetchone()
        lock.release()
        self.team_id = row[0]
        self.name = row[1]
        self.current_location_id = row[2]

    def custom_load(self, where: str, values: tuple):
        lock.acquire()
        c.execute("SELECT * FROM Team WHERE " + where, values)
        row = c.fetchone()
        lock.release()
        self.team_id = row[0]
        self.name = row[1]
        self.current_location_id = row[2]

    def insert(self):
        lock.acquire()
        c.execute("INSERT INTO Team(name, current_location_id) VALUES (?,?)",
                  (self.name, self.current_location_id))
        lock.release()

    def update(self):
        lock.acquire()
        c.execute("UPDATE Team SET name = ?, current_location_id = ? WHERE team_id = ?",
                  (self.name, self.current_location_id, self.team_id))
        lock.release()

    def delete(self):
        lock.acquire()
        c.execute("DELETE FROM Team WHERE team_id = ?", str(self.team_id))
        lock.release()


class Team_list:
    items = []

    def custom_load(self, where: str, values: tuple):
        self.items = []
        lock.acquire()
        c.execute("SELECT * FROM Team WHERE " + where, values)
        rows = c.fetchall()
        lock.release()
        for item in rows:
            t = Team()
            t.team_id = item[0]
            t.name = item[1]
            t.current_location_id = item[2]
            self.items.append(t)

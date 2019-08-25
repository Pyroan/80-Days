import sqlite3 as sql

# TODO LITERALLY ANY ERROR HANDLING SMH
conn = sql.connect('internal.sqlite3')
c = conn.cursor()

def save():
    conn.commit()

class Location:
    location_id: int
    name: str

    def load(self, id):
        c.execute("SELECT * FROM Location WHERE location_id = ?", str(id))
        row = c.fetchone()
        self.location_id = row[0]
        self.name = row[1]

    def custom_load(self, where: str, values: tuple):
        c.execute("SELECT * FROM Location WHERE " + where, values)
        row = c.fetchone()
        self.location_id = row[0]
        self.name = row[1]
    
    def insert(self):
        c.execute("INSERT INTO Location(name) VALUES (?)",
            (self.name))
    
    def update(self):
        c.execute("UPDATE Location SET name = ? WHERE location_id = ?",
            (self.name, self.location_id))
    
    def delete(self):
        c.execute("DELETE FROM Location WHERE location_id = ?", str(self.location_id))

class Location_list:
    items = []

    def custom_load(self, where: str, values: tuple):
        self.items = []
        c.execute("SELECT * FROM Location WHERE " + where, values)
        rows = c.fetchall()
        for item in rows:
            l = Location()
            l.location_id = item[0]
            l.name = item[1]
            self.items.append(l)

class LocationEdge:
    edge_id: int
    start_location_id : int
    end_location_id: int
    weight: int

    def load(self, id):
        c.execute("SELECT * FROM LocationEdge WHERE edge_id = ?", str(id))
        row = c.fetchone()
        self.edge_id = row[0]
        self.start_location_id = row[1]
        self.end_location_id = row[2]
        self.weight = row[3]

    def custom_load(self, where: str, values: tuple):
        c.execute("SELECT * FROM LocationEdge WHERE " + where, values)
        row = c.fetchone()
        self.edge_id = row[0]
        self.start_location_id = row[1]
        self.end_location_id = row[2]
        self.weight = row[3]
    
    def insert(self):
        c.execute("INSERT INTO LocationEdge(start_location_id, end_location_id, weight) VALUES (?,?,?)",
            (self.start_location_id, self.end_location_id, self.weight))
    
    def update(self):
        c.execute("UPDATE LocationEdge SET start_location_id = ?, end_location_id = ?, weight = ? WHERE edge_id = ?", 
            (self.start_location_id, self.end_location_id, self.weight, self.edge_id))
    
    def delete(self):
        c.execute("DELETE FROM LocationEdge WHERE edge_id = ?", str(self.edge_id))


class LocationEdge_list:
    items = []

    def custom_load(self, where: str, values: tuple):
        self.items = []
        c.execute("SELECT * FROM LocationEdge WHERE " + where, values)
        rows = c.fetchall()
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

    def load(self, id):
        c.execute("SELECT * FROM Log WHERE log_id = ?", str(id))
        row = c.fetchone()
        self.log_id = row[0]
        self.date = row[1]
        self.game_day = row[2]
        self.msg = row[3]
        self.sent = row[4]
        self.target_channel_id = row[5]

    def custom_load(self, where: str, values: tuple):
        c.execute("SELECT * FROM Log WHERE " + where, values)
        row = c.fetchone()
        self.log_id = row[0]
        self.date = row[1]
        self.game_day = row[2]
        self.msg = row[3]
        self.sent = row[4]
        self.target_channel_id = row[5]
    
    def insert(self):
        c.execute("INSERT INTO Log(date, game_day, msg, sent) VALUES (?,?,?,?,?)",
            (self.date, self.game_day, self.msg, self.sent, self.target_channel_id))
    
    def update(self):
        c.execute("UPDATE Log SET date = ?, game_day = ?, msg = ?, sent = ?, target_channel_id = ? WHERE log_id = ?",
            (self.date, self.game_day, self.msg, self.sent, self.target_channel_id, self.log_id))
    
    def delete(self):
        c.execute("DELETE FROM Log WHERE log_id = ?", str(self.log_id))

class Log_list:
    items = []

    def custom_load(self, where: str, values: tuple):
        self.items = []
        c.execute("SELECT * FROM Log WHERE " + where, values)
        rows = c.fetchall()
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
        c.execute("SELECT * FROM Payment WHERE payment_id = ?", str(id))
        row = c.fetchone()
        self.payment_id = row[0]
        self.player_id = row[1]
        self.team_id = row[2]
        self.amount = row[3]
        self.location_edge = row[4]
        self.time = row[5]

    def custom_load(self, where: str, values: tuple):
        c.execute("SELECT * FROM Team WHERE " + where, values)
        row = c.fetchone()
        self.payment_id = row[0]
        self.player_id = row[1]
        self.team_id = row[2]
        self.amount = row[3]
        self.location_edge = row[4]
        self.time = row[5]
    
    def insert(self):
        c.execute("INSERT INTO Payment(player_id, team_id, amount, location_edge, time) VALUES (?,?,?,?,?)",
            (self.player_id, self.team_id, self.amount, self.location_edge, self.time))
    
    def update(self):
        c.execute("UPDATE Payment SET player_id = ?, team_id = ?, amount = ?, location_edge = ?, time = ? WHERE payment_id = ?",
            (self.player_id, self.team_id, self.amount, self.location_edge, self.time, self.payment_id))

    def delete(self):
        c.execute("DELETE FROM Payment WHERE payment_id = ?", str(self.payment_id))

class Payment_list:
    items = []

    def custom_load(self, where: str, values: tuple):
        self.items = []
        c.execute("SELECT * FROM Payment WHERE " + where, values)
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



class Player:
    player_id: int
    discord_id: str
    team_id: int
    coins: int

    def __init__(self):
        self.player_id = -1

    def load(self, id):
        c.execute("SELECT * FROM Player WHERE player_id = ?", str(id))
        row = c.fetchone()
        self.player_id = row[0]
        self.discord_id = row[1]
        self.team_id = row[2]
        self.coins = row[3]

    def custom_load(self, where: str, values: tuple):
        c.execute("SELECT * FROM Player WHERE " + where, values)
        row = c.fetchone()
        self.player_id = row[0]
        self.discord_id = row[1]
        self.team_id = row[2]
        self.coins = row[3]
    
    def insert(self):
        c.execute("INSERT INTO Player(discord_id, team_id, coins) VALUES (?,?,?)",
            (self.discord_id, self.team_id, self.coins))
    
    def update(self):
        c.execute("UPDATE Player SET discord_id = ?, team_id = ?, coins = ? WHERE player_id = ?",
            (self.discord_id, self.team_id, self.coins, self.player_id ))

    def delete(self):
        c.execute("DELETE FROM Player WHERE player_id = ?", str(self.player_id))


class Team:
    team_id: int
    name: str
    current_location_id: int
    
    def load(self, id):
        c.execute("SELECT * FROM Team WHERE team_id = ?", str(id))
        row = c.fetchone()
        self.team_id = row[0]
        self.name = row[1]
        self.current_location_id = row[2]
    
    def custom_load(self, where: str, values: tuple):
        c.execute("SELECT * FROM Team WHERE " + where, values)
        row = c.fetchone()
        self.team_id = row[0]
        self.name = row[1]
        self.current_location_id = row[2]

    def insert(self):
        c.execute("INSERT INTO Team(name, current_location_id) VALUES (?,?)",
            (self.name, self.current_location_id))

    def update(self):
        c.execute("UPDATE Team SET name = ?, current_location_id = ? WHERE team_id = ?",
            (self.name, self.current_location_id, self.team_id))

    def delete(self):
        c.execute("DELETE FROM Team WHERE team_id = ?", str(self.team_id))

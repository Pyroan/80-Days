import sqlite3 as sql

conn = sql.connect('internal.sqlite3')
c = conn.cursor()

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

    def insert(self):
        c.execute("INSERT INTO Team(name, current_location_id) VALUES (?,?)",
            (self.name, self.current_location_id))

    def update(self):
        c.execute("UPDATE Team SET name = ?, current_location_id = ? WHERE team_id = ?",
            (self.name, self.current_location_id, self.team_id))

    def delete(self):
        pass

def save():
    conn.commit()
        




def test():
    t = Team()
    t.name = "Golden Bears"
    t.save()

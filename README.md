![discord shield](https://img.shields.io/discord/614335416178442242?color=7289DA&label=players&logo=discord)

**Join the game [Here](https://pyroan.itch.io/80-days)**
# 80-Days
A Collaborative Chat Game for Extra Credits Game Jam #5

Probably a bad idea.

I love game jams.

## How To Set up An Instance Of This Jam Spaghetti (For if you want to fork and whatnot)
#### Honestly I'm sorry in advance.
1. Clone the repo
2. Install Python 3.6, and `pip` if you haven't already.
3. Navigate to the repo, and run `pip install -r requirements.txt`
4. Follow [this guide](https://discordpy.readthedocs.io/en/latest/discord.html#discord-intro) to create an application and obtain a bot token.
5. Set an environment variable (you'll have to look up how to do this on your own system/container) called `80DAYS_TOKEN` and use the token you acquired in the previous step as the value.

6. Install [DB Browser for SQLite](https://sqlitebrowser.org/) or equivalent database browser.
7. Import `old-data/internal.sql` into your viewer to create the database. The db should be called `discordbot/internal.sqlite3`. I'm not sure how that works.
8. Create a Discord server using [this template](https://discord.new/7UTcVmSvh6qa).
9. Enable Discord's Developer Mode if you haven't already. (Settings -> Appearance -> Advanced -> Developer Mode)
10. Open `discordbot/config.json`. Change the value for `progress-annnouncements` to the id for your Progress Announcements channel, and the value for `test` to the id your test channel. You can get the ids by right clicking on the channel in Discord and clicking "Copy ID".
    * While you're here, it might be best if you set `game-ongoing` to 0 as well, if it isn't already.
11. Run `start.sh`. If everything works, you should find this somewhere in your output:
```
INFO:root:Use this link to invite 80Days:
INFO:root:https://discordapp.com/oauth2/authorize?client_id={YOUR CLIENT ID HERE}&scope=bot&permissions=8
```
12. Use that link to invite 80Days to your server.
13. Go to any channel in your server and try `!ping`. If that works, you should be pretty much set.

## Some tips for those who would like to contribute/fork
* You'll probably need the docs for [discord.py](https://discordpy.readthedocs.io/en/latest/) and [schedule](https://schedule.readthedocs.io/en/stable/)
* As players join they'll be randomly assigned a flair
* Those with the Monarch role can use hidden commands `!startgame` and `!endgame`, though end of game will normally happen automatically.
* Also, if you're currently playing this game, maybe don't use the data to cheat? That'd be nice :)

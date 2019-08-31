import discord
import asyncio
from discord.ext.commands import Bot
from discord.ext import commands
from discord.utils import find, get
import logging
import os
from random import randint
import json
from datetime import datetime
import time
import threading

import models
import graphanalyzer
import scheduledjobs
import paymentreducer
import helpers


logging.basicConfig(level=logging.INFO)
client = Bot(description="80 Days Bot", command_prefix=("!"))


with open('config.json') as f:
    config = json.loads(f.read())

@client.event
async def on_ready():
    logging.info('Logged in as ' + client.user.name + ' (ID:' + str(client.user.id) + ')')
    logging.info('Use this link to invite {}:'.format(client.user.name))
    logging.info('https://discordapp.com/oauth2/authorize?client_id={}&scope=bot&permissions=8'.format(client.user.id))

# Also triggers end of game. Sue me. HACK
@client.event
async def check_for_new_logs():
    while True:
        try: 
            if helpers.get_game_day() > config['game_length'] and config['game_ongoing']:
                await end_game()
            t = models.Team_list()
            t.custom_load("team_id > ?", (0,))
            for team in t.items:
                if team.current_location_id == 0 and config['game_ongoing']:
                    await end_game()

            logs = models.Log_list()
            logs.custom_load("sent = ?", (0,))
            if len(logs.items) > 0:
                logging.info("Found {} new logs, attempting to send...".format(len(logs.items)))
                # Try to send them and die inside.
                try:
                    for log in logs.items:
                        ch = get(client.get_all_channels(), id=log.target_channel_id)
                        await ch.send(log.msg)
                        log.sent = 1
                        log.update()
                    models.save()
                except AttributeError:
                    logging.error("We can't see the channel yet. We'll get 'em next time.")
            await asyncio.sleep(5)
        except Exception as e:
            # HACK bandaid to stop the logs from crashing _permanently_
            logging.error("Error while checking for logs:\n\t{}".format(e))

async def end_game():
    logging.info("Time to end the game!")
    ch = get(client.get_all_channels(), id=config["channels"]["progress-announcements"])
    config['game_ongoing'] = 0
    with open('config.json', 'w') as f:
        json.dump(config, f)
    scheduledjobs.config = config
    helpers.config = config
    # Load winners
    winners = []
    teams = models.Team_list()
    teams.custom_load("team_id > ?", (0,))
    for t in teams.items:
        start_loc = t.current_location_id
        if start_loc == 1:
            start_loc = 0
        winners.append((t.name, graphanalyzer.dijkstra(graphanalyzer.graph, start_loc, 0)))
    winners.sort(key=lambda x: x[1], reverse=True)
    # Make a big deal of everything, really.
    try :
        await ch.send("All right, adventurers! The game has ended! Drumroll please!!!")
        await(asyncio.sleep(5))
        await ch.send("In third place, with {}km remaining, the {}!".format(winners[0][1], winners[0][0]))
        await(asyncio.sleep(3))
        await ch.send("In second place, with {}km remaining, the {}!!".format(winners[1][1], winners[1][0]))
        await(asyncio.sleep(3))
        await ch.send("Finally, in first place, the {}!!!!!!!!! Congratulations!".format(winners[2][0]))
        await(asyncio.sleep(3))
        await ch.send("Thank you all for playing! I hope you had fun! Now, I'm going to take a nap. Maybe we can do this again some time :sweat_smile:")
    except AttributeError:
        logging.info("Can't see the channel. We'll get 'em next time.")
        return
    exit()

@commands.has_role("King")
@client.command(hidden=True)
async def endgame(ctx):
    await end_game()

@client.event
async def on_member_join(member):
    pa_chan = get(member.guild.text_channels, name="player-assignments")
    ins_chan = get(member.guild.text_channels, name="instructions")
    # Assign the new member to one of the three teams randomly
    # FIXME Get number of teams through the DB and not hardcode a 3
    team_id = randint(1,3)
    t = models.Team()
    t.load(team_id)
    # Add flair to user
    role = get(member.guild.roles, name=t.name)
    await member.add_roles(role)
    # Create new Player record.
    p = models.Player()
    # First check if they already exist
    try:
        p.custom_load("discord_id = ?", (member.id,))
        t.load(p.team_id)
        await pa_chan.send("Welcome back, {}! the **{}** missed you!".format(member.mention, t.name))
        return
    except Exception:
        pass
    p.discord_id = member.id
    p.team_id = team_id
    p.coins = config['starting_coins']
    p.insert()
    models.save()

    # Post message to player-assignments channel
    await pa_chan.send(
        "Welcome, {}! You have been assigned to the **{}**!\n\
        Make sure to check out the {} and good luck!".format(
            member.mention,
            t.name, 
            ins_chan.mention
        )
        )

@client.command(hidden=True)
async def ping(ctx):
    await ctx.send("I am here.")

# Make a payment toward an available location
@client.command(brief="Make a payment toward an available location")
async def pay(ctx, target_location, amount):
    if not config['game_ongoing']: return

    amount = int(amount) # dumb.
    member = ctx.message.author
    p = models.Player()
    try:
        p.custom_load("discord_id = ?", (member.id,))
    except Exception:
        await ctx.send("I don't have you listed as a player, {}\n\
            If you believe this is an error, please talk to a Lord or the King".format(
                member.mention))
        return
    # Make sure player has enough coins!!!
    if amount < 1:
        await ctx.send("You can't pay 0 or negative coins, {}".format(member.mention))
        return
    elif amount > p.coins:
        await ctx.send("{}, you don't have enough coins!".format(member.mention))
        return
    # Get team, current location id, available locations
    t = models.Team()
    t.load(p.team_id)
    current_loc = t.current_location_id
    avail_locs = graphanalyzer.get_next_location_list(t.team_id)
    # Make sure it's a valid target location.
    if target_location.lower() not in (name.lower() for name in avail_locs.keys()):
        await ctx.send("I don't think {} is a valid location. Maybe you mistyped it?".format(
            target_location
        ))
        return
    # Get the ID for the target location...
    target_loc = models.Location()
    target_loc.custom_load("name = ? COLLATE NOCASE", (target_location,))

    edge = models.LocationEdge()
    edge.custom_load("start_location_id = ? AND end_location_id = ?",
        (current_loc, target_loc.location_id,))
    # Store the payment in the db
    payment = models.Payment()
    payment.player_id = p.player_id
    payment.team_id = p.team_id
    payment.amount = amount
    payment.location_edge = edge.edge_id
    payment.time = helpers.get_game_day()
    payment.insert()

    # Remove coins from player's account.
    p.coins -= amount
    p.update()
    models.save()
    # Send confirmation message.
    await ctx.send("{} has paid **{}** coins toward **{}**".format(
        member.mention, amount, target_loc.name))


# just pay() but with negative coins and another team
@client.command(brief="Pay to ruin another team's chances of progressing")
async def sabotage(ctx, target_team, target_location, amount):
    if not config['game_ongoing']: return
    # just pay() but with negative coins and another team
    amount = int(amount) # still dumb
    member = ctx.message.author
    p = models.Player()
    try:
        p.custom_load("discord_id = ?", (member.id,))
    except Exception:
        await ctx.send("Gonna be hard to sabotage when I don't have you listed as a player, {}\n\
            If you believe this is a mistake, please talk to a Lord or the King".format(member.mention))
        return
    # Mke sure player has enough coins
    if amount < 1:
        await ctx.send("You can't pay 0 or negative coins, {}".format(member.mention))
        return
    elif amount > p.coins:
        await ctx.send("{}, you don't have enough coins!".format(member.mention))
        return
    
    t = models.Team()
    try:
        t.custom_load("name = ? COLLATE NOCASE", (target_team,)) # TODO make this more user-friendly
    except Exception:
        await ctx.send("I don't think {} is a real team, {}. Make sure you type the full name!".format(
            target_team, member.mention
        ))
        return
    
    if t.team_id == p.team_id:
        await ctx.send("You can't sabotage your own team, {}!!! They won't like you for that!".format(
            member.mention
        ))
        return
    
    current_loc = t.current_location_id
    avail_locs = graphanalyzer.get_next_location_list(t.team_id)
    # Validate target location...
    if target_location.lower() not in (name.lower() for name in avail_locs.keys()):
        await ctx.send("I don't think {} is a valid location. Maybe a typo?".format(
            target_location
        ))
        return
    # Get id for the target location...
    location = models.Location()
    location.custom_load("name = ? COLLATE NOCASE", (target_location,))

    edge = models.LocationEdge()
    edge.custom_load("start_location_id = ? AND end_location_id = ?",
        (current_loc, location.location_id))
    
    # Store the payment!
    payment = models.Payment()
    payment.player_id = p.player_id
    payment.team_id = t.team_id
    payment.amount = -amount # VERY IMPORTANT DIFFERENCE
    payment.location_edge = edge.edge_id
    payment.time = helpers.get_game_day()
    payment.insert()

    # Remove coins from the player's account
    p.coins -= amount
    p.update()
    models.save()
    # Send confirmation message.
    await ctx.send("{} has paid **{}** coins to sabotage the **{}'** trip to **{}**".format(
        member.mention, amount, t.name, location.name
    ))


# Print's players current coin count
@client.command(brief="Get your current coin count")
async def me(ctx):
    if not config['game_ongoing']: return
    member = ctx.message.author
    try:
        p = models.Player()
        p.custom_load("discord_id = ?", (member.id,))
        await ctx.send("{}, you have **{}** coins".format(member.mention, p.coins))
    except Exception:
        # Show error if user isn't actually playing
        await ctx.send("I... don't believe you're playing, {}\n\
            (If you think this is a mistake, please talk to a Lord or the King)".format(member.mention))

# Prints the player's team's current funding for the day,
# As well as current location,
# And total distance remaining.
@client.command(brief="Get your team's progress for the day")
async def team(ctx):
    if not config['game_ongoing']: return
    member = ctx.message.author
    try:
        p = models.Player()
        p.custom_load("discord_id = ?", (member.id,))
    except Exception:
        await ctx.send("I don't think you're playing, {}\n\
            (If you think this is a mistake, please talk to a Lord or the King)".format(member.mention))
        return
    t = models.Team()
    t.load(p.team_id)
    l = models.Location()
    l.load(t.current_location_id)
    funding_table = paymentreducer.get_funding_table(p.team_id, helpers.get_game_day())
    await ctx.send("Your team is in **{}**, with at least **{}km** to go!\nHere is how today's funding is going:\n{}".format(
        l.name, graphanalyzer.dijkstra(graphanalyzer.graph, t.current_location_id, 0), "```"+funding_table+"```"))


@client.command(brief="Start the game!", hidden=True)
@commands.has_role("King")
async def startgame(ctx):
    logging.info("The king has signalled to begin the game!")
    # Reset every player's coins
    logging.info("Resetting player coins...")
    ps = models.Player_list()
    ps.custom_load("player_id > ?", (0,)) # HACK to select all
    for p in ps.items:
        p.coins = config["starting_coins"]
        p.update()
    # Reset every team's starting location
    logging.info("Resetting team locations...")
    ts = models.Team_list()
    ts.custom_load("team_id > ?", (0,)) # SAME HACK to select all
    for t in ts.items:
        t.current_location_id = 1
        t.update()

    # Set time to -1 for all payments (i'm sorry reality)
    logging.info("Invalidating previous payments...")
    pmts = models.Payment_list()
    pmts.custom_load("time >= ?", (0,))
    for p in pmts.items:
        p.time = -1
        p.update()

    models.save()
    # Update config
    config['game_ongoing'] = 1
    d = datetime.now()
    d = d.replace(minute=0, second=0,microsecond=0)
    config['start_date'] = str(d)
    with open('config.json', 'w') as f:
        json.dump(config, f)
    scheduledjobs.config = config
    helpers.config = config
    scheduledjobs.on_new_day()


client.loop.create_task(check_for_new_logs())
client.run(os.environ['80DAYS_TOKEN'])

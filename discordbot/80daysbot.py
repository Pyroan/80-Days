import discord
import asyncio
from discord.ext.commands import Bot
from discord.ext import commands
from discord.utils import find, get
import logging
import os
from random import randint
import json


import models


logging.basicConfig(level=logging.INFO)
client = Bot(description="80 Days Bot", command_prefix=("!"), pm_help=True)

with open('config.json') as f:
    config = json.loads(f.read())

@client.event
async def on_ready():
    logging.info('Logged in as ' + client.user.name + ' (ID:' + str(client.user.id) + ')')
    logging.info('Use this link to invite {}:'.format(client.user.name))
    logging.info('https://discordapp.com/oauth2/authorize?client_id={}&scope=bot&permissions=8'.format(client.user.id))

# @client.event
# async def on_log():
#     # Post an update to the game announcements channel
#     pass
    

@client.event
async def on_member_join(member):
    #TODO Handle if a player leaves and rejoins

    # Assign the new member to one of the three teams randomly
    #TODO Get number of teams through the DB and not hardcode a 3
    team_id = randint(1,3)
    t = models.Team()
    t.load(team_id)
    # Add flair to user
    role = get(member.guild.roles, name=t.name)
    await member.add_roles(role)
    # Create new Player record.
    p = models.Player()
    p.discord_id = member.id
    p.team_id = team_id
    p.coins = config['starting_coins']
    p.insert()
    models.save()

    # Post message to player-assignments channel
    pa_chan = get(member.guild.text_channels, name="player-assignments")
    ins_chan = get(member.guild.text_channels, name="instructions")
    await pa_chan.send(
        "Welcome, {}! You have been assigned to the **{}**!\n\
        Make sure to check out the {} and good luck!".format(
            member.mention,
            t.name, 
            ins_chan.mention
        )
        )

@client.command()
async def ping(ctx):
    await ctx.send("I am here.")

@client.command(pass_context=True)
async def pay(ctx, target_location, amount):
    # Get the data we need
    
    # Make sure it's a valid location.
    # Store the payment in the db

    # Send confirmation message.
    pass

@client.command(pass_context=True)
async def sabotage(ctx, target_team, target_location, amount):
    # just pay() but with negative coins and another team
    pass

# Print's players current coin count
@client.command()
async def me(ctx):
    member = ctx.message.author
    try:
        p = models.Player()
        p.custom_load("discord_id = ?", (member.id,))
        await ctx.send(">>> {}, you have {} coins".format(member.mention, p.coins))
    except Exception:
        # Show error if user isn't actually playing
        await ctx.send("I... don't believe you're playing.\n\
            (If you think this is a mistake, please talk to a Lord or the King)")

# Prints the player's team's current funding for the day,
# As well as current location,
# And total distance remaining.
@client.command()
async def team(ctx):
    # funding_table = ""
    # ctx.send("Your team is in {}, with {}km remaining\n\
    #     Here is how your funding is going:\n{}".format())
    pass

client.run(os.environ['80DAYS_TOKEN'])

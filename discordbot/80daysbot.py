import discord
import asyncio
from discord.ext.commands import Bot
from discord.ext import commands
from discord.utils import find
import logging
import os
from random import randint

import models


logging.basicConfig(level=logging.INFO)
client = Bot(description="80 Days Bot", command_prefix=("!"), pm_help=True)

@client.event
async def on_ready():
    logging.info('Logged in as ' + client.user.name + ' (ID:' + client.user.id + ')')
    logging.info('Use this link to invite {}:'.format(client.user.name))
    logging.info('https://discordapp.com/oauth2/authorize?client_id={}&scope=bot&permissions=8'.format(client.user.id))

@client.event
async def on_log():
    # Post an update to the game announcements channel
    pass
    

@client.event
async def on_member_join(member):
    # Assign the new member to one of the three teams randomly

    # Create new Player record.
    pass

@client.command()
async def ping():
    await client.say("I am here.")

@client.command(pass_context=True)
async def pay(ctx, target_location, amount):
    # Get the data we need

    # Store the payment in the db

    # Send confirmation message.
    pass

@client.command(pass_context=True)
async def sabotage(ctx, target_team, target_location, amount):
    # just pay() but with negative coins and another team
    pass



client.run(os.environ['80DAYS_TOKEN'])

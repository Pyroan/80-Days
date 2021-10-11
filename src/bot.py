import asyncio
import json
import logging
import os
import re
from pathlib import Path
from random import randint

import discord
from discord.ext.commands import Bot, has_role
from discord.ext.commands.help import DefaultHelpCommand
from discord.utils import get

import graphanalyzer
import helpers
import scheduledjobs
from admin import Admin
from ingame import InGame
from model import models

logging.basicConfig(level=logging.INFO)
intents = discord.Intents.default()
intents.members = True
client = Bot(description="80 Days Bot", command_prefix=(
    "!"), intents=intents, help_command=DefaultHelpCommand(verify_checks=False))


with open(Path(__file__).parent / 'config.json') as f:
    config = json.load(f)


def start_bot():
    client.add_cog(InGame(client))
    client.add_cog(Admin(client))
    client.loop.create_task(check_for_new_logs())
    client.run(os.environ['80DAYS_TOKEN'])


@client.event
async def on_ready():
    logging.info('Logged in as ' + client.user.name +
                 ' (ID:' + str(client.user.id) + ')')
    logging.info('Use this link to invite {}:'.format(client.user.name))
    logging.info(
        'https://discordapp.com/oauth2/authorize?client_id={}&scope=bot&permissions=8'.format(client.user.id))


@client.event
async def check_for_new_logs():
    # Also triggers end of game. Sue me. HACK
    while True:
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
            logging.info(
                "Found {} new logs, attempting to send...".format(len(logs.items)))
            # Try to send them and die inside.
            try:
                for log in logs.items:
                    ch = get(client.get_all_channels(),
                             id=log.target_channel_id)
                    await ch.send(log.msg)
                    log.sent = 1
                    log.update()
                models.save()
            except AttributeError:
                logging.error(
                    "We can't see the channel yet. We'll get 'em next time.")
        await asyncio.sleep(5)


@client.command(hidden=True)
@has_role("Monarch")
async def endgame(ctx):
    await end_game()


async def end_game():
    logging.info("Time to end the game!")
    ch = get(client.get_all_channels(),
             id=config["channels"]["progress-announcements"])
    config['game_ongoing'] = 0
    with open(Path(__file__).parent / 'config.json', 'w') as f:
        json.dump(config, f, indent=4)
    scheduledjobs.config = config
    helpers.config = config
    # Invalidate All Oustanding Logs
    logs = models.Log_list()
    logs.custom_load("sent = ?", (0,))
    if len(logs.items) > 0:
        try:
            for log in logs.items:
                log.sent = 1
                log.update()
        except Exception as e:
            logging.error("Failed to invalidate old logs - {}".format(e))
        models.save()
    # Load winners
    winners = []
    teams = models.Team_list()
    teams.custom_load("team_id > ?", (0,))
    for t in teams.items:
        start_loc = t.current_location_id
        if start_loc == 1:
            start_loc = 0
        winners.append((t.name, graphanalyzer.dijkstra(
            graphanalyzer.graph, start_loc, 0)))
    winners.sort(key=lambda x: x[1], reverse=True)
    # Make a big deal of everything, really.
    try:
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


@client.event
async def on_member_join(member):
    pa_chan = get(member.guild.text_channels, name="player-assignments")
    ins_chan = get(member.guild.text_channels, name="instructions")
    # Assign the new member to one of the three teams randomly
    # FIXME Get number of teams through the DB and not hardcode a 3
    team_id = randint(1, 3)
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
    p.last_active_day = helpers.get_game_day()
    p.shares = 100
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


@client.command(brief="Opt in to the next game")
async def join(ctx):
    member = ctx.message.author
    if config['game_ongoing']:
        await ctx.send("Sorry, {}, you can't join the game while it's ongoing!".format(member.mention))
        return
    p = models.Player()
    # Make sure player doesn't already exist
    try:
        p.custom_load('discord_id = ?', (member.id,))
        await ctx.send("I think you're already playing, {}. If you think this is an error, please talk to a Lord or the Monarch".format(member.mention))
        return
    except Exception:
        pass
    # Pick a team
    team_id = randint(1, 3)
    team = models.Team()
    team.load(team_id)

    # Add flair to user
    role = get(member.guild.roles, name=team.name)
    await member.add_roles(role, reason='Player joined game')
    # Remove spectator role
    role = get(member.guild.roles, name='Spectator')
    if role in member.roles:
        await member.remove_roles(role, reason='Player joined game')

    # Create new player
    p.discord_id = member.id
    p.team_id = team_id
    p.coins = config['starting_coins']
    p.last_active_day = 0
    p.shares = 100
    p.insert()
    models.save()
    logging.info("{} has joined the {}".format(member.id, team.name))
    await ctx.send("{}, you've been added to the **{}**! Good Luck!".format(member.mention, team.name))


@client.command(brief="Switch to spectator mode. Can't switch back until game is over")
async def spectate(ctx):
    member = ctx.message.author
    if helpers.get_game_day() > config['latest_spectate_day'] and config['game_ongoing']:
        await ctx.send("Sorry, {}, it's too late to switch to spectator mode".format(member.mention))
        return

    player = models.Player()
    team = models.Team()
    try:
        player.custom_load("discord_id = ?", (str(member.id),))
        team.load(player.team_id)
    except Exception as e:
        await ctx.send("I think you're already out of the game, {}. If you think this was a mistake, please talk to a Lord or the Monarch".format(member.mention))
        logging.error(e)
        return
    # Remove flair from user
    role = get(member.guild.roles, name=team.name)
    await member.remove_roles(role, reason='Player left game')
    # Add spectator role
    role = get(member.guild.roles, name='Spectator')
    await member.add_roles(role, reason='Player left game')

    player.delete()
    models.save()

    logging.info("{} has switched to spectating".format(member.id))
    await ctx.send("{}, you're now a spectator. Enjoy the show!".format(member.mention))


@client.command(brief="Roll some dice. Just for fun :)")
async def roll(ctx, dice):
    member = ctx.message.author
    if not re.fullmatch(r'\d*d?\d+', dice):
        await ctx.send("I don't recognize that format, {}.\n Please phrase your roll as 'x', 'dx', or 'ydx'".format(member.mention))
    # Parse the argument to make it play nice
    d = dice.split('d')
    if len(d) == 1:
        d.insert(0, '1')
    if d[0] == '':
        d[0] = '1'
    d = list(map(int, d))
    # Validations so people don't explode the bot
    if d[0] > 1000:
        await ctx.send("Keeping that many dice in my head makes me dizzy, {}.\n Roll 1000 dice max, please.".format(member.mention))
        return
    # Roll some dice
    total = 0
    for _ in range(d[0]):
        total += randint(1, d[1])
    await ctx.send("Result of {}'s roll: **{}**".format(member.mention, total))

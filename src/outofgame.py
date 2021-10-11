import json
import logging
from pathlib import Path
from random import randint

from discord.ext.commands import Cog, command
from discord.utils import get

import helpers
from model import models


class OutOfGame(Cog, name="Out Of Game"):
    # Handles commands that only work between games

    def __init__(self, bot):
        self.bot = bot
        with open(Path(__file__).parent / 'config.json') as f:
            self.config = json.load(f)

    @command(brief="Opt in to the next game")
    async def join(self, ctx):
        member = ctx.message.author
        if self.config['game_ongoing']:
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
        p.coins = self.config['starting_coins']
        p.last_active_day = 0
        p.shares = 100
        p.insert()
        models.save()
        logging.info("{} has joined the {}".format(member.id, team.name))
        await ctx.send("{}, you've been added to the **{}**! Good Luck!".format(member.mention, team.name))

    @command(brief="Switch to spectator mode. Can't switch back until game is over")
    async def spectate(self, ctx):
        member = ctx.message.author
        if helpers.get_game_day() > self.config['latest_spectate_day'] and self.config['game_ongoing']:
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

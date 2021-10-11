import asyncio
import json
import logging
from datetime import datetime
from pathlib import Path
from random import randint

from discord.ext.commands import Cog, command, has_role
from discord.utils import get

import helpers
import scheduledjobs
from config import config
from model import models


class Admin(Cog):
    # Handles commands only usable by the server Admin

    def __init__(self, bot):
        self.bot = bot

    def cog_check(self, ctx):
        return has_role(config["admin_role"]).predicate(ctx)

    @command(brief="Start the game!", hidden=True)
    async def startgame(self, ctx):
        logging.info("The Monarch has signalled to begin the game!")
        # Reset every player's coins
        logging.info("Resetting player coins and last_active_day...")
        ps = models.Player_list()
        ps.custom_load("player_id > ?", (0,))  # HACK to select all
        for p in ps.items:
            p.coins = config["starting_coins"]
            p.last_active_day = 0
            p.update()
        # Reset every team's starting location
        logging.info("Resetting team locations...")
        ts = models.Team_list()
        ts.custom_load("team_id > ?", (0,))  # SAME HACK to select all
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
        d = d.replace(minute=0, second=0, microsecond=0)
        config['start_date'] = str(d)
        with open(Path(__file__).parent / 'config.json', 'w') as f:
            json.dump(config, f, indent=4)
        scheduledjobs.config = config
        helpers.config = config
        scheduledjobs.on_new_day()

    @command(brief="Scramble teams", hidden=True)
    async def scramble(self, ctx):
        # TODO fix rate limiting issue becuase I think it's breaking more things.
        guild = ctx.message.guild
        logging.info(guild)
        players = models.Player_list()
        players.load_all()
        for p in players.items:
            old_team_id = p.team_id
            # Pick a number & update player
            team_id = randint(1, 3)
            if old_team_id != team_id:
                p.team_id = team_id
                p.update()
                old_team = models.Team()
                old_team.load(old_team_id)
                team = models.Team()
                team.load(team_id)
                # Clear/Assign role
                old_team_role = get(guild.roles, name=old_team.name)
                team_role = get(guild.roles, name=team.name)
                member = guild.get_member(int(p.discord_id))
                if member is None:
                    logging.info(
                        "Player w/ id {} not found. Maybe they left the server.".format(p.discord_id))
                    continue
                await member.remove_roles(old_team_role, reason="Automated Team Scramble")
                await member.add_roles(team_role, reason="Automated Team Scramble")
                logging.info("{} (ID:{}) moved from {} to {}".format(
                    member.nick if member.nick is not None else member.name, p.discord_id, old_team.name, team.name))
                await asyncio.sleep(1)
        models.save()
        logging.info("Scramble complete")

    @command(brief="Make sure roles match the teams in the db", hidden=True)
    async def validateteams(self, ctx):
        bad, missing = 0, 0
        guild = ctx.message.guild
        logging.info(guild)
        players = models.Player_list()
        players.load_all()
        for p in players.items:
            member = guild.get_member(int(p.discord_id))
            t = models.Team()
            t.load(p.team_id)
            if member is None:
                logging.info(
                    "Player w/ id {} not found. Maybe they left the server.".format(p.discord_id))
                missing += 1
            else:
                if member.top_role.name != t.name:
                    logging.error("{} (ID:{})'s role is {}, but it should be {}".format(
                        member.nick if member.nick is not None else member.name, p.discord_id, member.top_role.name, t.name
                    ))
                    bad += 1
        logging.info("Validation done. {}/{} roles are correct. ({} missing)".format(
            len(players.items)-bad-missing, len(players.items)-missing, missing))

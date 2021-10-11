import json
from pathlib import Path

from discord.ext.commands import Cog, command

import graphanalyzer
import helpers
import paymentreducer
from model import models


class InGame(Cog, name="In-Game"):
    # Handles commands that only work in-game

    def __init__(self, bot):
        self.bot = bot
        with open(Path(__file__).parent / 'config.json') as f:
            self.config = json.load(f)

    def cog_check(self, ctx):
        # Skip the decorated command if the game isn't ongoing
        return self.config['game_ongoing']

    @command(brief="Make a payment toward an available location")
    async def pay(self, ctx, target_location, amount):

        amount = int(amount)  # dumb.
        member = ctx.message.author
        p = models.Player()
        try:
            p.custom_load("discord_id = ?", (member.id,))
        except Exception:
            await ctx.send("I don't have you listed as a player, {}\n\
                If you believe this is an error, please talk to a Lord or the Monarch".format(
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
        # target_loc.load((current_loc + 1) % 51)  # Hax for Paris

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
        p.last_active_day = helpers.get_game_day()
        p.update()
        models.save()
        # Send confirmation message.
        await ctx.send("{} has paid **{}** coins toward **{}**".format(
            member.mention, amount, target_loc.name))

    @command(brief="Pay to ruin another team's chances of progressing")
    async def sabotage(self, ctx, target_team, target_location, amount):
        # just pay() but with negative coins and another team
        amount = int(amount)  # still dumb
        member = ctx.message.author
        p = models.Player()
        try:
            p.custom_load("discord_id = ?", (member.id,))
        except Exception:
            await ctx.send("Gonna be hard to sabotage when I don't have you listed as a player, {}\n\
                If you believe this is a mistake, please talk to a Lord or the Monarch".format(member.mention))
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
            # TODO make this more user-friendly
            t.custom_load("name = ? COLLATE NOCASE", (target_team,))
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
        # location.load((current_loc + 1) % 51)  # Hax for Paris

        edge = models.LocationEdge()
        edge.custom_load("start_location_id = ? AND end_location_id = ?",
                         (current_loc, location.location_id))

        # Store the payment!
        payment = models.Payment()
        payment.player_id = p.player_id
        payment.team_id = t.team_id
        payment.amount = -amount  # VERY IMPORTANT DIFFERENCE
        payment.location_edge = edge.edge_id
        payment.time = helpers.get_game_day()
        payment.insert()

        # Remove coins from the player's account
        p.coins -= amount
        p.last_active_day = helpers.get_game_day()
        p.update()
        models.save()
        # Send confirmation message.
        await ctx.send("{} has paid **{}** coins to sabotage the **{}'** trip to **{}**".format(
            member.mention, amount, t.name, location.name
        ))

    @command(brief="Get your current coin count")
    async def me(self, ctx):
        # Print's players current coin count
        member = ctx.message.author
        try:
            p = models.Player()
            p.custom_load("discord_id = ?", (member.id,))
            await ctx.send("{}, you have **{}** coins".format(member.mention, p.coins))
            if p.last_active_day != helpers.get_game_day():
                p.last_active_day = helpers.get_game_day()
                p.update()
                models.save()
        except Exception:
            # Show error if user isn't actually playing
            await ctx.send("I... don't believe you're playing, {}\n\
                (If you think this is a mistake, please talk to a Lord or the Monarch)".format(member.mention))

    @command(brief="Get your team's progress for the day")
    async def team(self, ctx):
        # Prints the player's team's current funding for the day,
        # As well as current location,
        # And total distance remaining.
        member = ctx.message.author
        try:
            p = models.Player()
            p.custom_load("discord_id = ?", (member.id,))
            if p.last_active_day != helpers.get_game_day():
                p.last_active_day = helpers.get_game_day()
                p.update()
                models.save()
        except Exception:
            await ctx.send("I don't think you're playing, {}\n\
                (If you think this is a mistake, please talk to a Lord or the Monarch)".format(member.mention))
            return
        t = models.Team()
        t.load(p.team_id)
        l = models.Location()
        l.load(t.current_location_id)
        funding_table = paymentreducer.get_funding_table(
            p.team_id, helpers.get_game_day())
        await ctx.send("Your team is in **{}**, with at least **{}km** to go!\nHere is how today's funding is going:\n{}".format(
            l.name, graphanalyzer.dijkstra(graphanalyzer.graph, t.current_location_id, 0), "```"+funding_table+"```"))

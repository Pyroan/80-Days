import re
from random import randint

from discord.ext.commands import Cog, command


class JustForFun(Cog, name="Just For Fun"):
    def __init__(self, bot):
        self.bot = bot

    @command(brief="Roll some dice. Just for fun :)")
    async def roll(self, ctx, dice):
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

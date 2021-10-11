# Canonical instance of config for the main thread (i.e. the bot and its cogs)
import json
from pathlib import Path

with open(Path(__file__).parent / 'config.json') as f:
    config = json.load(f)

# Converts data from our databse into an open json format,
# so people can run their own data analysis and stuff for Nerd Fun
import json
from .discordbot.models import *
from jsonschema import validate

with open("80daysgame.schema.json") as f:
    schema = json.load(f)


def datafy() -> str:
    data = ""
    validate(data, schema)
    return data

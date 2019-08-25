import models

# Minimum distance between two location ID's
def get_min_distance(start, end):
    pass

# Return a ditionary of location names and distances for locations
#  connected to the team's scurrent location
def get_next_location_list(team_id):
    locations = {}

    team = models.Team()
    team.load(team_id)
    edges = models.LocationEdge_list()
    edges.custom_load("start_location_id = ?", (team.current_location_id,))
    # Load end locations
    ls = models.Location_list()
    # HACK HACK HACK
    ls.custom_load("location_id IN ({})".format(','.join(["?"] * len(edges.items))),
        [x.end_location_id for x in edges.items])

    # MUCH BIGGER HACK that could have been solved with a join instead but why bother
    for l in ls.items:
        locations[l.name] = list(filter(
            lambda x: x.end_location_id == l.location_id, edges.items))[0].weight

    return locations

import models

# Minimum distance between two nodes
def get_min_distance(start, end):
    pass

# Return a list of location names connected to the
# team's scurrent location
def get_next_location_list(team_id):

    team = models.Team()
    team.load(team_id)
    edges = models.LocationEdge_list()
    edges.custom_load("start_location_id = ?", (team.current_location_id,))
    # Load end locations
    ls = models.Location_list()
    # HACK HACK HACK
    ls.custom_load("location_id IN ({})".format(','.join(["?"] * len(edges.items))),
        [x.end_location_id for x in edges.items])

    return [x.name for x in ls.items]

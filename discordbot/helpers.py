# Helper functions, mostly for creating the game
import models

def create_edge(start_loc, end_loc, weight=0):
    print("Trying to create {} -> {}".format(start_loc, end_loc))
    start = models.Location()
    start.custom_load("name = ? COLLATE NOCASE", (start_loc,))
    end = models.Location()
    end.custom_load("name = ? COLLATE NOCASE", (end_loc,))

    edge = models.LocationEdge()
    edge.start_location_id = start.location_id
    edge.end_location_id = end.location_id
    edge.weight = weight
    edge.insert()

    print("Added {} to {}, Weight: {}".format(
        start.name, end.name, edge.weight))

def create_all_edges(save=False):
    edges = {}
    with open('map.txt') as f:
        for line in f.readlines():
            line = line.strip()
            if line[0] == '#':
                continue
            l = line.split('->')
            key = l[0].strip()
            values = l[1].strip().split(', ')
            edges[key] = values
    
    for k, v in edges.items():
        for loc in v:
            create_edge(k, loc)
    
    if save:
        models.save()


create_all_edges(save = True)
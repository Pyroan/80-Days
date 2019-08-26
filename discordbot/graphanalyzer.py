import models
from collections import defaultdict

# This class and dijkstra() adapted from https://gist.github.com/econchick/4666413
# because i'm running out of time.
class Graph:
  def __init__(self):
    self.nodes = set()
    self.edges = defaultdict(list)
    self.distances = {}

  def add_node(self, value):
    self.nodes.add(value)

  def add_edge(self, from_node, to_node, distance):
    self.edges[from_node].append(to_node)
    self.distances[(from_node, to_node)] = distance

# Supply 0 as target to return to the beginning
def dijkstra(graph, initial, target):
    
  visited = {initial: 0}
  path = {}

  nodes = set(graph.nodes)

  while nodes: 
    min_node = None
    for node in nodes:
      if node in visited:
        if min_node is None:
          min_node = node
        elif visited[node] < visited[min_node]:
          min_node = node

    if min_node is None:
      break

    nodes.remove(min_node)
    current_weight = visited[min_node]

    if min_node is target:
        return current_weight

    for edge in graph.edges[min_node]:
      weight = current_weight + graph.distances[(min_node, edge)]
      if edge not in visited or weight < visited[edge]:
        visited[edge] = weight
        path[edge] = min_node

  return -1


def generate_graph():
    g = Graph()
    ls = models.Location_list()
    ls.custom_load("location_id > ?", (0,))
    for l in ls.items:
        g.add_node(l.location_id)
    g.add_node(0)

    les = models.LocationEdge_list()
    les.custom_load("edge_id > ?", (0,))
    for le in les.items:
        if le.end_location_id == 1:
            g.add_edge(le.start_location_id, 0, le.weight)
        else:
            g.add_edge(le.start_location_id, le.end_location_id, le.weight)

    return g

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

graph = generate_graph()
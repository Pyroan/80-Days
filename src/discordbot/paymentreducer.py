# Performs calculations on payments
import models
from datetime import datetime, timedelta
import helpers

# Return a list of dicts of current funding progress
# funding_list[location_id] = paid
def get_funding_list(team_id, day, show_sabotage):
    ps = models.PaymentSummary()
    #ps.load_payment_summary(helpers.get_game_day(), team_id)
    ps.load_payment_summary(day, team_id, show_sabotage)
    # Get sum of the amounts for each location_edge

    return ps.items
    
# Return a string to display the team's funding progress.
# IGNORES SABOTAGE.
def get_funding_table(team_id, day=-1):
    #f = get_funding_list(team_id, day=helpers.get_game_day(), show_sabotage=False)
    f = get_funding_list(team_id, day, show_sabotage=False)
    if len(f.keys()) == 0:
        return "No payments have been made yet today!"
        
    t = models.Team()
    t.load(team_id)
    tab = []
    row_format = "{:<18}{:<8}{:<8}\n"
    tab.append(row_format.format('Location', 'Toll', 'Paid'))
    tab.append("-"*(34)+"\n")
    # FIXME toooo many queries
    for k, v in f.items():
        le = models.LocationEdge()
        le.load(k)
        l = models.Location()
        l.load(le.end_location_id)
        tab.append(row_format.format(l.name, le.weight, v))

    return "".join(tab)
    
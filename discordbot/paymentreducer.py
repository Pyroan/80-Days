# Performs calculations on payments
import models
from datetime import datetime, timedelta
import helpers

# Return a list of dicts of current funding progress
# funding_list[location_id] = paid
def get_funding_list(team_id):
    ps = models.PaymentSummary()
    #ps.load_payment_summary(helpers.get_game_day(), team_id)
    ps.load_payment_summary(0, team_id)
    # Get sum of the amounts for each location_edge

    return ps.items
    
# Return a string to display the team's funding progress.
def get_funding_table(team_id):
    columns = ['Location', 'Toll', 'Paid']
    f = get_funding_list(team_id)
    pass
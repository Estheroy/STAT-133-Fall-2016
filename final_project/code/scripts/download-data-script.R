# =========================================================================
# Title: download-data-script.R
# 
# Description:
# This script contains R code to scrape the tables'Roster', 'Totals', and 
# 'Salaries', for a specific NBA team.
# Each table is read as a data.frame, which is then exported as a csv file
# to the corresponding subdirectory in the 'rawdata/' folder
# =========================================================================

# Load the packages that will be used in the project
library(XML)

# source your functions
source("code/functions/download-data-functions.R")

# base url
basketref <- 'http://www.basketball-reference.com'

# =========================================================================
# The desired html tables are in URL's having this form:
# "http://www.basketball-reference.com/teams/CLE/2016.html"
# "http://www.basketball-reference.com/teams/TOR/2016.html"
# "http://www.basketball-reference.com/teams/MIA/2016.html"
# ...
#
# The first step is to extract the part of the url associate with each
# team, that is: /teams/CLE/2016.html, /teams/TOR/2016.html, ...
#
# To do that, we'll scrape the the page:
# "http://www.basketball-reference.com/leagues/NBA_2016.html"
# in order to extract the 'href' attributes of the anchor tags:
# /teams/CLE/2016.html
# /teams/TOR/2016.html
# /teams/MIA/2016.html
# ...
#
# These attributes are extracted as a character vector
# (these will be used to parse each team's page)
# =========================================================================

# parse 'http://www.basketball-reference.com/leagues/NBA_2016.html'
url <- paste0(basketref, '/leagues/NBA_2016.html')
doc <- htmlParse(url)

# identify nodes with anchor tags for each team and
# extract the href attribute from the anchor tags
team_rows <- getNodeSet(doc, "//th[@scope='row']/a")
team_hrefs <- unique(xmlSApply(team_rows, xmlAttrs))

# just in case, here's the character vector with the team abbreviations
team_names <- substr(team_hrefs, 8, 10)

# =========================================================================
# Scrape the tables Roster, Totals, and Salaries.
# Now we can pass the first value in 'team_hrefs' to the base url, and form:
# http://www.basketball-reference.com/teams/CLE/2016.html
# 
# The code below scrapes the tables for the Cleveland Cavaliers (CLE)
# You will have to write a loop that iterates over each team page
# and scrapes the required tables
# =========================================================================

# Read html document (as a character vector) for a given team
for(i in 1:30) {
  
  # Read html document (as a character vector) for a given team
  url_team <- paste0(basketref, team_hrefs[i])
  html_doc <- readLines(con <- url_team)
  
  # Scrape the roster table html
  # initial line position of roster html table
  begin_roster <- get_begin_roster()
  # find the line where the html ends
  line_counter <- get_end_table(begin_roster, html_doc)
  # read roster table as data.frame and export it as csv
  write_roster_csv(begin_roster, line_counter, html_doc, team_names[i])
  
  # Scrape the total table html
  # initial line position of totals html table
  begin_totals <- get_begin_total()
  # find the line where the html ends
  line_counter <- get_end_table(begin_totals, html_doc)
  # read totals table as data.frame and export it as csv
  write_total_csv(begin_roster, line_counter, html_doc, team_names[i])
 
  # Scrape the salary table html
  # initial line position of salaries html table
  begin_salaries <- get_begin_salary()
  # find the line where the html ends
  line_counter <- get_end_table(begin_salaries, html_doc)
  # read salaries table as data.frame and export it as csv
  write_salary_csv(begin_roster, line_counter, html_doc, team_names[i])
}


# =========================================================================
# Title: download-data-function.R
# 
# Description:
# This script contains R functions to download and scrape the tables'Roster',
# 'Totals', and 'Salaries', for specific NBA teams.
# =========================================================================


# Function to initial line position of roster html table
get_begin_roster <- function() {
  
  # function to initial line position of roster html table
  # input: None
  # output: the begin line number for html table

  begin <- grep('id="roster"', html_doc)
  return(begin)
}

# Function to initial line position of stat html table
get_begin_total <- function() {
  # function to initial line position of roster html table
  # input: None
  # output: the begin line number for html table

  begin <- grep('id="totals"', html_doc)
  return(begin)
}

# Function to initial line position of salary html table
get_begin_salary <- function() {
  # function to initial line position of roster html table
  # input: None
  # output: the begin line number for html table

  begin <- grep('id="salaries"', html_doc)
  return(begin)
}

# Function to find the line where the roster html table ends
get_end_table <- function(line_counter, html_doc) {
  # function to initial line position of roster html table
  # input: line_counter, the line where the table starts 
  #        html_doc, the doc that need to be downloaded
  # output: the line where the roster html table ends
  
  while (!grepl("</table>", html_doc[line_counter])) {
    line_counter <- line_counter + 1
  }
  return(line_counter)
}

# Function to read roster table as data.frame and export it as csv
write_roster_csv <- function(begin_roster, line_counter, html_doc, team_name) {
  # function to initial line position of roster html table
  # input: begin_roster, the begining line number for html table
  #        line_counter, the line counts of the html table
  #        html_doc, the html table used for downloading data
  #        team_name, the name for each team
  # output: None

  roster <- readHTMLTable(html_doc[begin_roster:line_counter])
  write.csv(roster, file <- paste0('data/rawdata/roster-data/roster-',
                                   team_name, '.csv'), row.names <- FALSE)
}

# Function to read totals table as data.frame and export it as csv
write_total_csv <- function(begin_roster, line_counter, html_doc, team_name) {
  # function to initial line position of roster html table
  # input: begin_roster, the begining line number for html table
  #        line_counter, the line counts of the html table
  #        html_doc, the html table used for downloading data
  #        team_name, the name for each team
  # output: None

  totals <- readHTMLTable(html_doc[begin_totals:line_counter])
  write.csv(totals, file <- paste0('data/rawdata/stat-data/stats-',
                                  team_name, '.csv'), row.names <- FALSE)
}

# Function to read salary table as data.frame and export it as csv
write_salary_csv <- function(begin_roster, line_counter, html_doc, team_name) {
  # function to initial line position of roster html table
  # input: begin_roster, the begining line number for html table
  #        line_counter, the line counts of the html table
  #        html_doc, the html table used for downloading data
  #        team_name, the name for each team
  # output: None

  salaries <- readHTMLTable(html_doc[begin_salaries:line_counter])
  write.csv(salaries, file <- paste0('data/rawdata/salary-data/salaries-', 
                                    team_name, '.csv'), row.names <- FALSE)
}
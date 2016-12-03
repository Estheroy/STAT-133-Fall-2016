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
library(readr)
library(dplyr)
library(stringr)


# source your functions
source("code/functions/clean-data-functions.R")

# =========================================================================

# Load the roster-data, salary-data stat-data from downloaded files 
all_roster_data <- list.files("data/rawdata/roster-data", full.names = TRUE)
all_salary_data <- list.files("data/rawdata/salary-data", full.names = TRUE)
all_stat_data <- list.files("data/rawdata/stat-data", full.names = TRUE)

# Get the Team name from the file name
Team <- substr(all_roster_data,33,35)

# Use for loop rename and clena the data columns from three difference data
# data frame and reformat some Date data and salary data
for(i in 1:30) {
  
  # assign the column name for roster table
  roster_col_name <- c("remove", "Number", "Player", "Position", 
                       "Height", "Weight", "Birth_Date", "Country", 
                       "Year_Experience", "College")
  
  # read csv data from each roster file
  each_roster_data <- read_csv(all_roster_data[i], col_names = roster_col_name, 
                               skip = 1)
  each_roster_data$remove <- NULL
  each_roster_data$Team <- Team[i]
  
  # assign column name for salary table
  salary_col_name <- c("remove","Rank", "Player", "Salary")
  each_salary_data <- read_csv(all_salary_data[i], col_names = salary_col_name, 
                               skip = 1)
  each_salary_data$remove <- NULL
  
  # assifn column name for stat table
  stat_col_name <- c("remove",
                     "Rank",
                     "Player",
                     "Age",
                     "Game",
                     "Games_Started",
                     "Minutes_Played",
                     "Field_Goals",
                     "Field_Goals_Attempts",
                     "Field_Goals_Pct",
                     "Three_Point_Field_Goals",
                     "Three_Point_Field_Goals_Attempts",
                     "Three_Point_Pct",
                     "Two_Point_Field_Goals",
                     "Two_Point_Field_Goals_Attempts",
                     "Two_Point_Pct",
                     "Effective_Field_Goals_Pct",
                     "Free_Throws",
                     "Free_Throws_Attempts",
                     "Free_Throws_Pct",
                     "Offensive_Rebounds",
                     "Defensive_Rebounds",
                     "Total_Rebounds",
                     "Assists",
                     "Steals",
                     "Blocks",
                     "Turnovers",
                     "Personal_Fouls",
                     "Points")
  each_stat_data <- read_csv(all_stat_data[i], 
                             col_names = stat_col_name, 
                             skip = 1)
  each_stat_data$remove <- NULL
  # merge all three roster, stat and salary table into one table
  roster_stat <- merge(each_roster_data, each_stat_data, "Player")
  roster_stat_salary <- merge(roster_stat, each_salary_data, "Player")
  
  # reformat the data for player's height
  height <- transform_height(roster_stat_salary$Height)
  roster_stat_salary$Height <- height
  
  # reformat the data for player's salary
  salary_num <- extract_salary(roster_stat_salary$Salary)
  roster_stat_salary$Salary <- salary_num
  
  # reformat the data for player's birhtday date
  date <- reformat_date(roster_stat_salary$Birth_Date)
  roster_stat_salary$Birth_Date <- date
  
  # write the result data frame for each team into new files
  write.csv(roster_stat_salary, 
            file = paste0('data/cleandata/clean-each-team/',
                          Team[i], '.csv'), row.names = FALSE)
}

# read data for each team from files and stack all team data into one total 
# table 
all_team_data <- list.files("data/cleandata/clean-each-team", 
                                full.names = TRUE)
total_team <- NULL
for(i in 1:30){
  each_team_data <- read_csv(all_team_data[i]) 
  total_team <- rbind(total_team, each_team_data)
}

# remove the duplicated team members from different team
total_team <- total_team[!duplicated(total_team$Player), ]

# reformat the year experience and position for team player
total_team$Year_Experience <- reformate_experience(total_team$Year_Experience)
total_team$Position <- reformat_position(total_team$Position)

# write the roster-salary-stats.csv into cleandata folder
write.csv(total_team, file = "data/cleandata/roster-salary-stats.csv", 
          row.names = FALSE)


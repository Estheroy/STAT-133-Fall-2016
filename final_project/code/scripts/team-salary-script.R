# =========================================================================
# Title: team-salary-script.R
# 
# Description:
# R script for computing the statistics for team salary. 
# =========================================================================

# load all the libarary that needed
library(readr)

# source the functions that needed
source("code/functions/team-salary-function.R")

# get the salary data for each team
team_salary_data_set <- each_team_salary_data()
write.csv(team_salary_data_set, 
		  file = "data/cleandata/team-salaries.csv", 
		  row.names = FALSE)


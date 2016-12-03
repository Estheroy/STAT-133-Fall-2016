# ========================================================================
# Title: team-salary-function.R
#
# Description:
# R script for functions for computing team-salaries.  
# 
# ========================================================================


# Function for computing team-salaries
each_team_salary_data <- function() {
    # functino for reformat the position column
    # input: None
    # output: the computed team salary statistics
    
    
    # saved each team's data into a folder clean_each_team under data/
    # cleandata.
    all_team_data <- list.files("data/cleandata/clean-each-team", 
                                full.names = TRUE)
    all_roster_data <- list.files("data/rawdata/roster-data", 
                                  full.names = TRUE)
    team_salary_data_new <- data.frame()
    
    # Use a for loop to get each team’s name from the roster-data which is 
    # under data/rawdata, and then we get the salary for each team's data set
    # Now we are doing the summary part for the data that we get. There are
    # ten variables Team_name, total_payroll, minimum_sasary, maximum_salary,
    # first_quartile_salary, median_salary, third_quartile_salary, 
    # average_salary, interquartitle_range, and standard_deviation
    for (i in 1 :30) {
        get_team_data <- all_team_data[i]
        read_get_team_data <- read_csv(get_team_data)
        get_salary <- read_get_team_data$Salary
        Team <- (substr(all_roster_data,33,35))[i]
        total_payroll <- sum(get_salary, na.rm = TRUE)
        minimum_salary <- min(get_salary, na.rm = TRUE)
        maximum_salary <- max(get_salary, na.rm = TRUE)
        first_quartile_salary <- quantile(get_salary, 0.25)
        median_salary <- median(get_salary, na.rm = TRUE)
        third_quartile_salary <-  quantile(get_salary, 0.75)
        average_salary <- mean(get_salary, na.rm = TRUE)
        interquartile_range <- IQR(get_salary, na.rm = TRUE) 
        standard_deviation <- sd(get_salary, na.rm = TRUE)
        team_salary_data <- data.frame(Team, total_payroll, minimum_salary, 
                                       maximum_salary, first_quartile_salary,
                                       median_salary, third_quartile_salary,
                                       average_salary, interquartile_range,
                                       standard_deviation)
    
        # use rbind to rebind the team_salary_data
        team_salary_data_new <- rbind(team_salary_data, team_salary_data_new)
    }
    return(team_salary_data_new)
}


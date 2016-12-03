# ========================================================================
# Title: shiny-stat-salary-function.R
#
# Description:
# R script for functions for Shiny app team-salaries.  
# To visualize the different statistics, it displays a horizontal bar-chart 
# (one bar per team) with one widget to select the desired statistic, and 
# another widget to indicate whether the bars should be displayed in decreasing
# order or in ascending order. Optionally, you can add more widgets to provide
# more options for customizing the displayed bar-chart (colors, bar widths, 
# legends, annotations, etc).
# ========================================================================

# Function for loading team efficency index
load_team_eff <- function() {
  # function for loading team efficency index
  # input, None
  # output, the full dataset for eff-salary-stat.csv

  data <- read_csv("eff-salary-stats.csv")
  return(data)
} 

# Function for loading the player's position
load_team_positon <- function() {
  # function for loading the player's position
  # input, None
  # output, the data frame with player's position information 

  roster_team <- read_csv("roster-salary-stats.csv") 
  dat <- data.frame(
    "player" = roster_team$Player,
    "position" = roster_team$Position
  )
}

# Function for getting the second variable for analysis
get_stats1 <- function(salary, statistics) {
  # function for getting the second variable for analysis
  # input, salary, the whole data set for salary
  #        statistcs, the statistics that need to be computed
  # output, the data frame with desired data column

  # load and get the data about team position
  team_position <- load_team_positon()
  eff <- salary
  eff$player <- salary$`player's name`
  eff$`player's name` <- NULL
  team_eff_position <- merge(team_position, eff, by = "player")
  
  # use a switch for getting the desired statistics columns
  # in a new data frame 
  switch(statistics,
         "total points" = {
           data.frame(
            player = team_eff_position$player,
            stat1 = team_eff_position$`total points`,
            position = team_eff_position$position)
         },
         "total rebounds" = {
           data.frame(
             player = team_eff_position$player,
             stat1 = team_eff_position$`total rebounds`,
             position = team_eff_position$position)
         },
         "assists" = {
           data.frame(
             player = team_eff_position$player,
             stat1 = team_eff_position$assists,
             position = team_eff_position$position)
         },
         "steals" = {
           data.frame(
             player = team_eff_position$player,
             stat1 = team_eff_position$steals,
             position = team_eff_position$position)
         },
         "blocks" = {
           data.frame(
             player = team_eff_position$player,
             stat1 = team_eff_position$blocks,
             position = team_eff_position$position)
         },
         "turnovers" = {
           data.frame(
             player = team_eff_position$player,
             stat1 = (-1) * team_eff_position$turnovers,
             position = team_eff_position$position)
         },
         "games played" = {
           data.frame(
             player = team_eff_position$player,
             stat1 = team_eff_position$`games played`,
             position = team_eff_position$position)
         },
         "salary" = {
           data.frame(
             player = team_eff_position$player,
             stat1 = team_eff_position$salary,
             position = team_eff_position$position)
         },
         "missed field goals" = {
           data.frame(
             player = team_eff_position$player,
             stat1 = (-1) * team_eff_position$`missed field goals`,
             position = team_eff_position$position)
         },
         "missed free throws" = {
           data.frame(
             player = team_eff_position$player,
             stat1 = (-1) * team_eff_position$`missed free throws`,
             position = team_eff_position$position)
         },
         "efficiency index" = {
           data.frame(
            player = team_eff_position$player,
            stat1 = team_eff_position$`efficiency index`,
            position = team_eff_position$position)
         })
}


get_stats2 <- function(salary, statistics) {
  # function for getting the second variable for analysis
  # input, salary, the whole data set for salary
  #        statistcs, the statistics that need to be computed
  # output, the data frame with desired data column

  # load and get the data about team position
  team_position <- load_team_positon()
  eff <- salary
  eff$player <- salary$`player's name`
  eff$`player's name` <- NULL
  team_eff_position <- merge(team_position, eff, by = "player")
  
  # use a switch for getting the desired statistics columns
  # in a new data frame 
  switch(statistics,
         "total points" = {
           data.frame(
             player = team_eff_position$player,
             stat2 = team_eff_position$`total points`,
             position = team_eff_position$position)
         },
         "total rebounds" = {
           data.frame(
             player = team_eff_position$player,
             stat2 = team_eff_position$`total rebounds`,
             position = team_eff_position$position)
         },
         "assists" = {
           data.frame(
             player = team_eff_position$player,
             stat2 = team_eff_position$assists,
             position = team_eff_position$position)
         },
         "steals" = {
           data.frame(
             player = team_eff_position$player,
             stat2 = team_eff_position$steals,
             position = team_eff_position$position)
         },
         "blocks" = {
           data.frame(
             player = team_eff_position$player,
             stat2 = team_eff_position$blocks,
             position = team_eff_position$position)
         },
         "turnovers" = {
           data.frame(
             player = team_eff_position$player,
             stat2 = (-1) * team_eff_position$turnovers,
             position = team_eff_position$position)
         },
         "games played" = {
           data.frame(
            player = team_eff_position$player,
            stat2 = team_eff_position$`games played`,
            position = team_eff_position$position)
         },
         "salary" = {
           data.frame(
             player = team_eff_position$player,
             stat2 = team_eff_position$salary,
             position = team_eff_position$position)
         },
         "missed field goals" = {
           data.frame(
             player = team_eff_position$player,
             stat2 = (-1)* team_eff_position$`missed field goals`,
             position = team_eff_position$position)
         },
         "missed free throws" = {
           data.frame(
             player = team_eff_position$player,
             stat2 = (-1) * team_eff_position$`missed free throws`,
             position = team_eff_position$position)
         },
         "efficiency index" = {
           data.frame(
             player = team_eff_position$player,
             stat2 = team_eff_position$`efficiency index`,
             position = team_eff_position$position)
         })
}

# Functions for computing graph for team salary statistcs
plot_stats <- function(data, x_stat, y_stat, position) {
  # function for computing graph for team salary statistcs
  # input, data, the data used for computing correlation 
  #        x_stat, the first variable
  #        y_stat, the second variable
  #        position, indicate whether to plot the scatter plot
  #                  in different color by position
  # output, None 

  stat1 <- get_stats1(data, x_stat)
  stat2 <- get_stats2(data, y_stat)
  
  data <- merge(stat1, stat2, by = c("player", "position"))
  
  if(position == TRUE) {
    ggplot(data, aes(x = stat1, y = stat2)) +
      geom_point(aes(colour = factor(position))) +
      xlab(x_stat) + 
      ylab(y_stat)
  } else {
    ggplot(data, aes(x = stat1, y = stat2)) +
      geom_point() +
      xlab(x_stat) + 
      ylab(y_stat)
  }
}

# Function for computing the correlation between two variables
find_corr <- function(data, x_stat, y_stat) {
  # function for computing the correlation between two variables
  # input, data, the data used for computing correlation 
  #        x_stat, the first variable
  #        y_stat, the second variable
  # output, the correlation value between these two variables
  
  x_stat <- get_stats1(data, x_stat)
  y_stat <- get_stats2(data, y_stat)
  correlation <- cor(x_stat$stat1, y_stat$stat2)
  return(as.character(correlation))
}

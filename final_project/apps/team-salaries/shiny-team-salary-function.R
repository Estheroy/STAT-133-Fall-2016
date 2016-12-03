# ========================================================================
# Title: shiny-team-salary-function.R
#
# Description:
# R script for functions for Shiny app team-salaries.  
# To visualize the different statistics, it displays a horizontal bar-chart 
# (one bar per team) with one widget to select the desired statistic, and 
# another widget to indicate whether the bars should be displayed in 
# decreasing order or in ascending order. Optionally, you can add more 
# widgets to provide more options for customizing the displayed bar-chart
# (colors, bar widths, legends, annotations, etc).
# ========================================================================


# Function for loading team salary
load_team_salary <- function() {
  # function for loading team salary
  # input: None
  # output: the data for team salary

  data <- read_csv("team-salaries.csv")
  return(data)
}

# Function for getting salary statistics
get_stats <- function(salary, statistics) {
  # function for getting salary statistics
  # input: None
  # output: the reformated the statistics variable name

  switch(statistics,
          "total payroll" = {
            data.frame(
              team = salary$Team,
              stat = salary$total_payroll)
          },
          "minimum salary" = {
            data.frame(
              team = salary$Team,
              stat = salary$minimum_salary)
          },
          "maximum salary" = {
            data.frame(
              team = salary$Team,
              stat = salary$maximum_salary)
          },
          "first quartile salary" = {
            data.frame(
              team = salary$Team,
              stat = salary$first_quartile_salary)
          },
          "median salary" = {
            data.frame(
              team = salary$Team,
              stat = salary$median_salary)
          },
          "third quartile salary" = {
            data.frame(
              team = salary$Team,
              stat = salary$third_quartile_salary)
          },
          "average salary" = {
            data.frame(
              team = salary$Team,
              stat = salary$average_salary)
          },
          "interquartile range" = {
            data.frame(
              team = salary$Team,
              stat = salary$interquartile_range)
          },
          "standard deviation" = {
            data.frame(
              team = salary$Team,
              stat = salary$standard_deviation)
          })
}

# Function for plotting team salary statistcs
plot_stats <- function(salary, statistics, order, show) {
  
  # function for plotting team salary statistcs
  # input: salary, the salary 
  #        statistics, the statistcs used for computing salary statistics
  #        order, indicate whether to show the bars according order
  #        show, indicate whether to show the legends
  # output: the plotted graph by using ggplot
  stat_to_plot <- get_stats(salary, statistics)
  
  # use if to check whether to order in descending order
  if(order == "Descending"){
    nba_team <- reorder(stat_to_plot$team, stat_to_plot$stat)
  } else {
    nba_team <- reorder(stat_to_plot$team, -(stat_to_plot$stat))
  }
  
  # use ggplot to plot the stat_to_plot bar plot
  ggplot(stat_to_plot, aes(x = nba_team, y = stat, fill = team)) +
    geom_bar(stat = "identity", show.legend = show) +
    coord_flip() + 
    ggtitle("bar chart for team statistics")
  
}


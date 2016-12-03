# ========================================================================
# Title: final-correlation.R
#
# Description:
# R script for analyzing and visualizing the relationship between salary 
# and other variables. 
# ========================================================================

# load library that will be used
library(ggplot2)
library(readr)
library(dplyr)

# read data from eff-salary-stas.csv
eff_data <- read_csv("data/cleandata/eff-salary-stats.csv")

# create a new data frame for computing the new efficiency
new_eff <- data.frame(
  
  # initlize the list for name
  name <- factor(c(
      "efficiency index",
      "steals", 
      "total points",
      "assists",
      "total rebounds", 
      "games played",
      "blocks", 
      "missed free throws",
      "turnovers",
      "missed field goals")),
  
  # calculate the correlation for difference variables
  corr <- c(
  "efficiency index" <- cor(eff_data$`total points`, 
                              eff_data$`efficiency index`),
  "steals" <- cor(eff_data$`total points`, eff_data$steals),
  "total points" <- cor(eff_data$`total points`, eff_data$salary),
  "assists" <- cor(eff_data$`total points`, eff_data$assists),
  "total rebounds" <- cor(eff_data$`total points`, eff_data$`total rebounds`),
  "games played" <- cor(eff_data$`total points`, eff_data$`games played`),
  "blocks" <- cor(eff_data$`total points`, eff_data$blocks),
  "missed free throws" <- cor(eff_data$`total points`, 
                              eff_data$`missed free throws`),
  "turnovers" <- cor(eff_data$`total points`, eff_data$turnovers),
  "missed field goals" <- cor(eff_data$`total points`,
                              eff_data$`missed field goals`))
)

# use the ggplot to plot the bar chart for different stats
plot = ggplot(new_eff, aes(x = reorder(name, corr), y = corr, fill = name)) + 
  geom_bar(stat = "identity") + 
  coord_flip() +
  ggtitle("Bar chart for correlation between salary and player statistics")

# save the above plot
ggsave(
  filename = 
    "images/Bar chart for correlation between salary and player statistics.png", 
  plot)

# =============================================================================

# read data from the roster-salary-stats.csv
roster_team <- read_csv("data/cleandata/roster-salary-stats.csv") 
position_dat <- data.frame(
  "player" = roster_team$Player,
  "position" = roster_team$Position
)

# Prepare the dataset for plotting
eff_data$player <- eff_data$`player's name`
eff_data$`player's name` <- NULL
position_stats_data <- merge(position_dat, eff_data, by = c("player"))
shooting_guard_data <- filter(position_stats_data, position == "shooting guard")
power_forward_Data <- filter(position_stats_data, position == "power forward")
center_data <- filter(position_stats_data, position == "center")
small_forward_data <- filter(position_stats_data, position == "small forward")
point_guard_data <- filter(position_stats_data, position == "point guard")

# =========================================================================
# Average Efficiency for Different Position Plot
# =========================================================================

avg_shooting_guard_eff <- mean(shooting_guard_data$`efficiency index`)
avg_power_forward_eff <- mean(power_forward_Data$`efficiency index`)
avg_center_data_eff <- mean(center_data$`efficiency index`)
avg_small_forward_eff <- mean(small_forward_data$`efficiency index`)
avg_point_guard_eff <- mean(point_guard_data$`efficiency index`)

avg_eff_position = data.frame(
  name = c("point_guard", "shooting_guard", "small_forward", 
           "center", "power_forward"),
  avg = c(
  "point_guard" = avg_point_guard_eff,
  "shooting_guard" = avg_shooting_guard_eff,
  "small_forward" =avg_small_forward_eff,
  "center" =avg_center_data_eff,
  "power_forward" = avg_power_forward_eff))


  
# use ggplot to plot the correlation between salary and player statistics
plot = ggplot(avg_eff_position, aes(x = reorder(name, avg),
                                    y = avg, fill = name)) + 
  geom_bar(stat = "identity") + 
  coord_flip() +
  ggtitle("Bar chart for Average Efficency for Different Position")

# save the above plot
ggsave(filename = 
         "images/Bar chart for Average Efficency for Different Position.png",
       plot)

# =========================================================================
# Average Salary for Different Position Plot
# =========================================================================

avg_shooting_guard_salary <- mean(shooting_guard_data$`salary`)
avg_power_forward_salary <- mean(power_forward_Data$`salary`)
avg_center_data_salary <- mean(center_data$`salary`)
avg_small_forward_salary <- mean(small_forward_data$`salary`)
avg_point_guard_salary <- mean(point_guard_data$`salary`)

avg_salary_position = data.frame(
    name = c("center", "power_forward",  "small_forward", 
             "point_guard", "shooting_guard"),
    avg = c(
    "center" = avg_center_data_salary,
    "power_forward" = avg_power_forward_salary,
    "small_forward" =avg_small_forward_salary,
    "point_guard" = avg_point_guard_salary,
    "shooting_guard" = avg_shooting_guard_salary))


# use ggplot to plot the correlation between salary and player statistics
plot = ggplot(avg_salary_position, aes(x = reorder(name, avg),
                                    y = avg, fill = name)) + 
  geom_bar(stat = "identity") + 
  coord_flip() +
  ggtitle("Bar chart for Average Salary for Different Position")

# save the above plot
ggsave(filename = 
         "images/Bar chart for Average Salary for Different Position.png", plot)

# =========================================================================
# Average Value for Different Position Plot
# =========================================================================

avg_value_position = data.frame(
  name = c("shooting_guard",  "point_guard",  "small_forward", 
           "center", "power_forward"),
  avg = c("shooting_guard" = avg_shooting_guard_eff/avg_shooting_guard_salary,
          "point_guard" = avg_point_guard_eff/avg_point_guard_salary,
          "small_forward" = avg_small_forward_eff/avg_small_forward_salary,
          "center" = avg_center_data_eff/avg_center_data_salary,
          "power_forward" = avg_power_forward_eff/avg_power_forward_salary))


# use ggplot to plot the correlation between salary and player statistics
plot = ggplot(avg_value_position, aes(x = reorder(name, avg),
                                       y = avg, fill = name)) + 
  geom_bar(stat = "identity") + 
  coord_flip() +
  ggtitle("Bar chart for Average Value for Different Position")

# save the above plot
ggsave(filename = 
         "images/Bar chart for Average Value for Different Position.png", plot)

# =========================================================================
# Regression Line plot
# =========================================================================

predict_data = data.frame(
  "position" = position_stats_data$position,
  "eff" = position_stats_data$`efficiency index`,
  "salary" = position_stats_data$salary)

eff_index <- predict_data$eff
salary <- predict_data$salary
eff_on_salary <- lm(salary ~ eff_index, data = predict_data)

# use ggplot to plot the correlation between salary and player statistics
plot = ggplot(predict_data, aes(x = eff_index, y = salary)) + 
  geom_point(aes(colour = factor(position)), size = 0.65) +
  ggtitle("Efficency Index and Salary Linear Regression Line") + 
  stat_smooth(method = "lm", col = "red")

# save the above plot
ggsave(filename = 
         "images/Efficency Index and Salary Linear Regression Line.png", plot)


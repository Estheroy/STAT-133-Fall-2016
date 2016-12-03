# =========================================================================
# Title: value-script.R
# 
# Description:
# R script for value for every player. 
# =========================================================================

# Load the packages that will be used in the project
library(readr)
library(dplyr)

# import using 'read_csv()'
df <- read_csv(
  'data/cleandata/eff-salary-stats.csv',
  col_names = TRUE)

# Calculate value
df["value"] <- df[, "efficiency index"] / df[, "salary"]
new_df <- df[order(df$value), c("player's name", "value")]

new_df <- arrange(new_df, desc(value))

# Take Top and Bottom 20 Players
bad <- tail(new_df[, "player's name"], 20)
good <- head(new_df[, "player's name"], 20)
colnames(bad) <- c("Bottom 20 Players")
colnames(good) <- c("Top 20 Players")

# Sink the output of the team value to txt
sink("data/cleandata/best-worst-value-players.txt")
good
bad
sink()

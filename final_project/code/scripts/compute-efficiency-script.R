# =========================================================================
# Title: compute-efficiency-script.R
# 
# Description:
# R script for performance evaluation for every player. 
# “efficiency” statistic (EFF)
# Principal Components Analysis (PCA)
# =========================================================================

# Load the packages that will be used in the project
library(readr)

# source your functions
source("code/functions/performance-functions.R")

# import using 'read_csv()'
roster_salary_stats <- read_csv(
  'data/cleandata/roster-salary-stats.csv',
  col_names = TRUE)

# Extract existing data and rename
df <- roster_salary_stats[, c("Player", "Points", 
                             "Total_Rebounds", 
                             "Assists", "Steals",
                             "Blocks", "Turnovers",
                             "Game", "Salary")]
names <- c("player's name", "total points", "total rebounds", 
           "assists", "steals", "blocks", "turnovers", 
           "games played", "salary")
colnames(df) <- names

# Calculate Missed Field Goals and Missed Free Throws
df[, "missed field goals"] <- missed_fg(roster_salary_stats[, "Field_Goals"], 
                                        roster_salary_stats[, "Field_Goals_Attempts"])
df[, "missed free throws"] <- missed_ft(roster_salary_stats[, "Free_Throws"], 
                                        roster_salary_stats[, "Free_Throws_Attempts"])

# Normalize by number of games played
numeric_cols <- c("total points", "total rebounds", 
                 "assists", "steals", "blocks", "turnovers", 
                 "missed field goals",
                 "missed free throws")
df[, numeric_cols] <- normalize(df[, numeric_cols], df[, "games played"])

# Negative Influence
cols <- c("missed field goals", "missed free throws", "turnovers")
df[cols] <- lapply(df[cols], negative)

# Divide into different position
df$Position <- roster_salary_stats$Position
c_df <- df[df$Position == "center",]
pf_df <- df[df$Position == "power forward",]
sf_df <- df[df$Position == "small forward",]
sg_df <- df[df$Position == "shooting guard",]
pg_df <- df[df$Position == "point guard",]

# Find weights using PCA
c_df.pca <- prcomp(c_df[, numeric_cols], scale. <- TRUE)
c_weights <- abs(c_df.pca$rotation[,1])
pf_df.pca <- prcomp(pf_df[, numeric_cols], scale. <- TRUE)
pf_weights <- abs(pf_df.pca$rotation[,1])
sf_df.pca <- prcomp(sf_df[, numeric_cols], scale. <- TRUE)
sf_weights <- abs(sf_df.pca$rotation[,1])
sg_df.pca <- prcomp(sg_df[, numeric_cols], scale. <- TRUE)
sg_weights <- abs(sg_df.pca$rotation[,1])
pg_df.pca <- prcomp(pg_df[, numeric_cols], scale. <- TRUE)
pg_weights <- abs(pg_df.pca$rotation[,1])

# Calculate EFF
c_df <- eff(c_df, c_weights, numeric_cols)
pf_df <- eff(pf_df, pf_weights, numeric_cols)
sf_df <- eff(sf_df, sf_weights, numeric_cols)
sg_df <- eff(sg_df, sg_weights, numeric_cols)
pg_df <- eff(pg_df, pg_weights, numeric_cols)
new_df <- rbind(c_df, pf_df, sf_df, sg_df, pg_df)
new_df$Position <- NULL

# Output dataframe
write.csv(new_df, file = "data/cleandata/eff-salary-stats.csv", 
          row.names = FALSE)

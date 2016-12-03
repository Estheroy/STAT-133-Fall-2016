# =========================================================================
# Title: eda-script.R
# 
# Description:
# R script for exploratory phase Exploratory Data Analysis (EDA). 
# Analyzing one variable at a time (i.e. univariate analysis) calculating 
# descriptive summaries for quantitative variables (e.g. mean, median, min, 
# max, std dev, range, etc), or frequencies for qualitative variables.
# Then, divert those results to a text file eda-output.txt in /data/cleandata. 
# It also produce histograms, boxplots, and bar-charts for each variable with 
# ggplot2, save() them in png or pdf format in the images/.
# =========================================================================

# Load the packages that will be used in the project
library(ggplot2)
library(dplyr)
library(readr)


# source your functions
source("code/functions/eda-functions.R")

# import using 'read_csv()'
roster_salary_stats <- read_csv(
  'data/cleandata/roster-salary-stats.csv',
  col_names <- TRUE)

# start recording the output from the EDA process
sink("data/cleandata/eda-output.txt")

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Team`
summary_qualitative(roster_salary_stats$Team)

plot <- ggplot(roster_salary_stats, aes(factor(Team))) +
  geom_bar(aes(fill = Team)) + 
  ggtitle("Bar Chart for Variable Team")
  
ggsave(filename = "images/Bar Chart for Variable Team.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Uniform Number`
summary_qualitative(roster_salary_stats$Number)

plot <- ggplot(roster_salary_stats, aes(factor(Number))) +
  geom_bar(aes(fill = Number)) + 
  ggtitle("Bar Chart for Variable Number")

ggsave(filename = "images/Bar Chart for Variable Number.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Position`
summary_qualitative(roster_salary_stats$Position)

plot <- ggplot(roster_salary_stats, aes(factor(Position))) +
  geom_bar(aes(fill = Position)) + 
  ggtitle("Bar Chart for Variable Position")

ggsave(filename = "images/Bar Chart for Variable Position.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Height`
summary_quantitative(roster_salary_stats$Height)

plot <- ggplot(roster_salary_stats, aes(x = Height)) +
  geom_histogram(aes(fill = ..count..), bins = 15) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Height")

ggsave(filename = "images/Histogram for Variable Height.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Height)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Height")

ggsave(filename = "images/Boxplot for Variable Height.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Weight`
summary_quantitative(roster_salary_stats$Weight)

plot <- ggplot(roster_salary_stats, aes(x = Weight)) +
  geom_histogram(aes(fill = ..count..), bins = 25) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Weight")

ggsave(filename = "images/Histogram for Variable Weight.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Weight)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Weight")

ggsave(filename = "images/Boxplot for Variable Weight.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Birth_Date`
summary_qualitative(roster_salary_stats$Birth_Date)

plot <- ggplot(roster_salary_stats, aes(factor(Birth_Date))) +
  geom_bar(aes(fill = Birth_Date)) + 
  ggtitle("Bar Chart for Variable Birth_Date")

ggsave(filename = "images/Bar Chart for Variable Birth Date.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Country`
summary_qualitative(roster_salary_stats$Country)

plot <- ggplot(roster_salary_stats, aes(factor(Country))) +
  geom_bar(aes(fill = Country)) + 
  ggtitle("Bar Chart for Variable Country")

ggsave(filename = "images/Bar Chart for Variable Country.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Year_Experience`
summary_quantitative(roster_salary_stats$Year_Experience)

plot <- ggplot(roster_salary_stats, aes(x = Age)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Year Experience")

ggsave(filename = "images/Histogram for Variable Age.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Age)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Year Experience")

ggsave(filename = "images/Boxplot for Variable Year Experience.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `College`
summary_qualitative(roster_salary_stats$College)

plot <- ggplot(roster_salary_stats, aes(factor(College))) +
  geom_bar(aes(fill = College),  show.legend = FALSE) + 
  ggtitle("Bar Chart for Variable College")

ggsave(filename = "images/Bar Chart for Variable College.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Age`
summary_quantitative(roster_salary_stats$Age)

plot <- ggplot(roster_salary_stats, aes(x = Age)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Age")

ggsave(filename = "images/Histogram for Variable Age.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Age)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Age")

ggsave(filename = "images/Boxplot for Variable Age.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Game`
summary_quantitative(roster_salary_stats$Game)

plot <- ggplot(roster_salary_stats, aes(x = Game)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") +
  ggtitle("Histogram for Variable Game")

ggsave(filename = "images/Histogram for Variable Game.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Game)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Game")

ggsave(filename = "images/Boxplot for Variable Game.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Games_Started`
summary_quantitative(roster_salary_stats$Games_Started)

plot <- ggplot(roster_salary_stats, aes(x = Games_Started)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Games Started")

ggsave(filename = "images/Histogram for Variable Games Started.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Games_Started)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Games Started")

ggsave(filename = "images/Boxplot for Variable Games Started.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Minutes_Played`
summary_quantitative(roster_salary_stats$Minutes_Played)

plot <- ggplot(roster_salary_stats, aes(x = Minutes_Played)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Minutes Played")

ggsave(filename = "images/Histogram for Variable Minutes Played.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Minutes_Played)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Minutes Played")

ggsave(filename = "images/Boxplot for Variable Minutes Played.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Field_Goals`
summary_quantitative(roster_salary_stats$Field_Goals)

plot <- ggplot(roster_salary_stats, aes(x = Field_Goals)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Field Goals")

ggsave(filename = "images/Histogram for Variable Field Goals.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Height)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Field Goals")

ggsave(filename = "images/Boxplot for Variable Field Goals.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Field_Goals_Attempts`
summary_quantitative(roster_salary_stats$Field_Goals_Attempts)

plot <- ggplot(roster_salary_stats, aes(x = Field_Goals_Attempts)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Field Goals Attempts")

ggsave(filename = "images/Histogram for Variable Field Goals Attempts.png", 
       plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Field_Goals_Attempts)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Field Goals Attempts")

ggsave(filename = "images/Boxplot for Variable Field Goals Attempts.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Field_Goals_Pct`
summary_quantitative(roster_salary_stats$Field_Goals_Pct)

plot <- ggplot(roster_salary_stats, aes(x = Field_Goals_Pct)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Field Goals Pct")

ggsave(filename = "images/Histogram for Variable Field Goals Pct.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Field_Goals_Pct)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Field_Goals_Pct")

ggsave(filename = "images/Boxplot for Variable Field_Goals_Pct.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Three_Point_Field_Goals`
summary_quantitative(roster_salary_stats$Three_Point_Field_Goals)

plot <- ggplot(roster_salary_stats, aes(x = Three_Point_Field_Goals)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Three Point Field Goals")

ggsave(filename = "images/Histogram for Variable Three Point Field Goals.png", 
        plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Three_Point_Field_Goals)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Three Point Field Goals")

ggsave(filename = "images/Boxplot for Variable Three Point Field Goals.png", 
        plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Three_Point_Field_Goals-Attempts`
summary_quantitative(roster_salary_stats$Three_Point_Field_Goals_Attempts)

plot <- ggplot(roster_salary_stats, aes(x = Three_Point_Field_Goals_Attempts)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Three Point Field Goals Attempts")

ggsave(filename = 
        "images/Histogram for Variable Three Point Field Goals Attempts.png", 
        plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), 
                                y = Three_Point_Field_Goals_Attempts)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Three Point Field Goals Attempts")

ggsave(filename = 
        "images/Boxplot for Variable Three Point Field Goals Attempts.png", 
        plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Three_Point_Pct`
summary_quantitative(roster_salary_stats$Three_Point_Pct)

plot <- ggplot(roster_salary_stats, aes(x = Three_Point_Pct)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Three Point Pct")

ggsave(filename = "images/Histogram for Variable Three Point Pct.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Three_Point_Pct)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Three Point Pct")

ggsave(filename = "images/Boxplot for Variable Three Point Pct.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Two_Point_Field_Goals`
summary_quantitative(roster_salary_stats$Two_Point_Field_Goals)

plot <- ggplot(roster_salary_stats, aes(x = Two_Point_Field_Goals)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Two Point Field Goals")

ggsave(filename = "images/Histogram for Variable Two Point Field Goals", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Two_Point_Field_Goals)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Two Point Field Goals")

ggsave(filename = "images/Boxplot for Variable Two Point Field Goals.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Two_Point_Field_Goals_Attempts`
summary_quantitative(roster_salary_stats$Two_Point_Field_Goals_Attempts)

plot <- ggplot(roster_salary_stats, aes(x = Two_Point_Field_Goals_Attempts)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Three Point Field Goals Attempts")

ggsave(filename = 
        "images/Histogram for Variable Three Point Field Goals Attempts.png", 
        plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), 
                                y = Two_Point_Field_Goals_Attempts)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Three Point Field Goals Attempts")

plot <- ggsave(filename = 
         "images/Boxplot for Variable Three Point Field Goals Attempts.png", 
       plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Two_Point_Pct`
summary_quantitative(roster_salary_stats$Two_Point_Pct)

plot <- ggplot(roster_salary_stats, aes(x = Two_Point_Pct)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Two_Point_Pct")

ggsave(filename = "images/Histogram for Variable Two_Point_Pct.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Two_Point_Pct)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Two_Point_Pct")

ggsave(filename = "images/Boxplot for Variable Two_Point_Pct.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Effective_Field_Goals_Pct`
summary_quantitative(roster_salary_stats$Effective_Field_Goals_Pct)

plot <- ggplot(roster_salary_stats, aes(x = Effective_Field_Goals_Pct)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Effective Field Goals_Pct")

ggsave(filename = "images/Histogram for Variable Effective Field Goals_Pct.png", 
       plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), 
                                y = Effective_Field_Goals_Pct)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Effective Field Goals_Pct")

ggsave(filename = "images/Boxplot for Variable Effective Field Goals_Pct.png", 
       plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Free_Throws`
summary_quantitative(roster_salary_stats$Free_Throws)

plot <- ggplot(roster_salary_stats, aes(x = Free_Throws)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Free Throws")

ggsave(filename = "images/Histogram for Variable Free Throws.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Free_Throws)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Free Throws")

ggsave(filename = "images/Boxplot for Variable Free Throws.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Free_Throws_Attempts`
summary_quantitative(roster_salary_stats$Free_Throws_Attempts)

plot <- ggplot(roster_salary_stats, aes(x = Free_Throws_Attempts)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Free Throws Attempts")

ggsave(filename = "images/Histogram for Variable Free Throws Attempts.png", 
       plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Free_Throws_Attempts)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Free Throws Attempts")

ggsave(filename = "images/Boxplot for Variable Free Throws Attempts.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Free_Throws_Pct`
summary_quantitative(roster_salary_stats$Free_Throws_Pct)

plot <- ggplot(roster_salary_stats, aes(x = Free_Throws_Pct)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Free Throws Pct")

ggsave(filename = "images/Histogram for Variable Free Throws Pct.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Free_Throws_Pct)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Free_Throws_Pct")

ggsave(filename = "images/Boxplot for Variable Free_Throws_Pct.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Offensive_Rebounds`
summary_quantitative(roster_salary_stats$Offensive_Rebounds)

plot <- ggplot(roster_salary_stats, aes(x = Offensive_Rebounds)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Offenstive Rebounds Per Game")

ggsave(filename = 
        "images/Histogram for Variable Offenstive Rebounds Per Game.png", 
        plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), 
                                y = Offensive_Rebounds)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Offenstive Rebounds Per Game")

ggsave(filename = 
        "images/Boxplot for Variable Offenstive Rebounds Per Game.png", 
        plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Defensive_Rebounds`
summary_quantitative(roster_salary_stats$Defensive_Rebounds)

plot <- ggplot(roster_salary_stats, aes(x = Defensive_Rebounds)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Defensive Rebounds Per Game")

ggsave(filename = 
        "images/Histogram for Variable Defensive Rebounds Per Game.png",
        plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), 
                                y = Defensive_Rebounds)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Defensive Rebounds Per Game")

ggsave(filename = 
        "images/Boxplot for Variable Defensive Rebounds Per Game.png", 
        plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Total_Rebounds`
summary_quantitative(roster_salary_stats$Total_Rebounds)

plot <- ggplot(roster_salary_stats, aes(x = Total_Rebounds)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Total Rebounds Per Game")

ggsave(filename = "images/Histogram for Variable Total Rebounds Per Game.png", 
        plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Total_Rebounds)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Total Rebounds Per Game")

ggsave(filename = "images/Boxplot for Variable Total Rebounds Per Game.png", 
        plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Assists`
summary_quantitative(roster_salary_stats$Assists)

plot <- ggplot(roster_salary_stats, aes(x = Assists)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Assists Per Game")

ggsave(filename = "images/Histogram for Variable Assists Per Game.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Assists)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Assists Per Game")

ggsave(filename = "images/Boxplot for Variable Assists Per Game.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Steals`
summary_quantitative(roster_salary_stats$Steals)

plot <- ggplot(roster_salary_stats, aes(x = Steals)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Steals Per Game")

ggsave(filename = "images/Histogram for Variable Steals Per Game.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Steals)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Steals Per Game")

ggsave(filename = "images/Boxplot for Variable Steals Per Game.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Blocks`
summary_quantitative(roster_salary_stats$Blocks)

plot <- ggplot(roster_salary_stats, aes(x = Blocks)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Blocks Per Game")

ggsave(filename = "images/Histogram for Variable Blocks Per Game.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Blocks)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Blocks Per Game")

ggsave(filename = "images/Boxplot for Variable Blocks Per Game.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Turnovers`
summary_quantitative(roster_salary_stats$Turnovers)

plot <- ggplot(roster_salary_stats, aes(x = Turnovers)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Turnovers Per Game")

ggsave(filename = "images/Histogram for Variable Turnovers Per Game.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Turnovers)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Turnovers Per Game")

ggsave(filename = "images/Boxplot for Variable Turnovers Per Game.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Personal_Fouls`
summary_quantitative(roster_salary_stats$Personal_Fouls)

plot <- ggplot(roster_salary_stats, aes(x = Personal_Fouls)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Personal Fouls Per Game")

ggsave(filename = "images/Histogram for Variable Personal Fouls Per Game.png", 
        plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Personal_Fouls)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Personal Fouls Per Game")

ggsave(filename = "images/Boxplot for Variable Personal Fouls Per Game.png", 
        plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Points`
summary_quantitative(roster_salary_stats$Points)

plot <- ggplot(roster_salary_stats, aes(x = Points)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Points Per Game")

ggsave(filename = "images/Histogram for Variable Points Per Game.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Points)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Points Per Game")

ggsave(filename = "images/Boxplot for Variable Points Per Game.png", plot)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Analysis for variable `Salary`
summary_quantitative(roster_salary_stats$Salary)

plot <- ggplot(roster_salary_stats, aes(x = Salary)) +
  geom_histogram(aes(fill = ..count..), bins = 20) +
  scale_fill_gradient("Count", low = "green", high = "red") + 
  ggtitle("Histogram for Variable Salary")

ggsave(filename = "images/Histogram for Variable Salary.png", plot)

plot <- ggplot(roster_salary_stats, aes(x = factor(0), y = Salary)) + 
  geom_boxplot(fill = "#CFCFCF") + 
  xlab("") + 
  ggtitle("Boxplot for Variable Salary")

ggsave(filename = "images/Boxplot for Variable Salary.png", plot)

sink()
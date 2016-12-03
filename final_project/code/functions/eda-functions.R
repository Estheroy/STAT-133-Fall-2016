# =========================================================================
# Title: eda-script.R
# 
# Description:
# R script containing functions for conducting the exploratory phase 
# Exploratory Data Analysis (EDA). 
# =========================================================================

# Load the packages that will be used in the project
library(readr)

# Function to compute descriptive summaries for quantitative data
summary_quantitative <- function(data) {
  # function to compute descriptive summaries for quantitative data
  # input: data, the data used for computing descreptive summaries
  # output: the summary for quantitative data

  summary <- c(
    mean <- mean(data, trim = 0, na.rm = TRUE), # find mean value
    median <- median(data, na.rm = TRUE), # find median value
    min <- min(data), # find minimum value
    max <- max(data), # find maximum value
    # find specific percentile
    first_quantile <- quantile(data, 0.25, na.rm = TRUE), 
    # find specific percentile
    third_quantile <- quantile(data, 0.75, na.rm = TRUE),
    IQR <- IQR(data, na.rm = TRUE), # inter-quartile range
    sd <- sd(data, na.rm = TRUE), # standard deviation
    range <- max(data) - min(data) # range
  )
  return(summary)
}

# Function to compute frequency summaries for qualitative data
summary_qualitative <- function(data) {

  # function for computing frequency summaries for qualitative data
  # input: data, the data used for plotting qualitative summary
  # ouput: the data table for qualitative summary
  data_table <- table(data)
  return(data_table)
}


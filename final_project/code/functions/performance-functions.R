
# =========================================================================
# Title: performance-functions.R
# 
# Description:
# R script for computing the performance effeiency for team members. 
# =========================================================================

# Calculate Missed FG
missed_fg <- function(fg, fga) {
  return(fga - fg)
}

# Calculate Missed FT
missed_ft <- function(ft, fta) {
  return(fta - ft)
}

# Normalize by games played
normalize <- function(df, gp) {
  for (col in names(df)) {
    df[, col] <- df[, col] / gp
  }
  return(df)
}

# Negative value
negative <- function(col) {
  return(-col)
}

# Calculate EFF
eff <- function(df, weights, numeric_cols) {
  new_df <- df
  eff <- colSums(t(df[, numeric_cols]) * weights)
  new_df[, "efficiency index"] <- eff
  return(new_df)
}

# Flip weights
# flip_weights <- function(weights) {
#   if (sum(sign(weights)) < 0) {
#     weights <- -1 * weights
#   }
#   return(weights)
# }

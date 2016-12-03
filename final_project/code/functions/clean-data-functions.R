# =========================================================================
# Title: clean-data-functions.R
# 
# Description:
# R script for clean data. 
# =========================================================================

# Function to extract day number
extract_day <- function(data_raw) { 
  # function for extracting the day number of the column Date
  # input: data_raw,  a character vector with date information
  # output: a numeric vector with day numbers
  
  day_comma <- str_split(data_raw, "\ ", simplify = TRUE)[, 2]
  day <- str_split(day_comma, ",", simplify = TRUE)[,1]
  return(as.numeric(day))
}

# Function to extract month name
extract_month <- function(data_raw) {
  # function for extracting the name of the month from the column Date
  # input: data_raw, a character vector with date information
  # output: a character vector with the names of the months
  
  month <- str_split(data_raw, "\ ", simplify = TRUE)[,1]
  return(month)
}

# Function to extract year number
extract_year <- function(data_raw) {
  # function for extracting the year number from the column Date
  # input: data_raw, a character vector with date information
  # output: a numeric vector with the year number
  
  year <-str_split(data_raw, ",\ ", simplify = TRUE)[,2]
  return(as.numeric(year))
}

# Function to reformat date (format "%d %B %Y)
reformat_date <- function(data_raw) {
  # function for reformating the date information
  # input: data_raw, a character vector with dat
  # output: a vector of class "Date" with format "%d %B %Y"
  
  dates_vector <- paste(extract_day(data_raw), 
                       extract_month(data_raw), extract_year(data_raw))
  dates <- as.Date(dates_vector, format = "%d %B %Y")
  return(dates)
}

# Function to extract year number
extract_salary <- function(data_raw) {
  # function for extracting the year number from the column Date
  # input: data_raw, a character vector with date information
  # output: a numeric vector with the year number
  salary <- str_replace_all(data_raw, "\\$", "")
  salary_number <- str_replace_all(salary, ",", "")
  return(as.numeric(salary_number))
}


# Function to extract year number
transform_height <- function(data_raw) {
  # function for extracting the year number from the column Date
  # input: data_raw, a character vector with date information
  # output: a numeric vector with the year number
  
  all_height <-do.call("rbind", strsplit(as.character(data_raw), split="-"))
  Feet_Convert_To_Inch <-12 * as.integer(all_height[, 1])
  Inch_Part <-as.integer(all_height[, 2])
  Inch_Convert_To_CM <-2.54 * (Feet_Convert_To_Inch + Inch_Part)
  return(Inch_Convert_To_CM)
}

# Function to reformat the R
reformat_R <- function(str) {
  # function for reoformating the R letter
  # input: str, the string that needed to be reformated
  # output, the reformatted string output
  if(str == "R"){
    return(0)
  } else {
    return(as.numeric(str))
  }
}

# Function to reformat year experience
reformate_experience <- function(exp) {
  # function for reformating the year experience
  # input: exp, the string that needed to be reformat
  # output: the reformatted string output
  for(i in 1:length(exp)){
    exp[i]<-reformat_R(exp[i])
  }
  return(exp)
  
}

# Function to reformat the abbreviated player's position
reformat_abbreviated_position <- function(str) {
  # Function for reformat the abbreviated player's position
  # intput: str, the string that need to be reformat
  # output: the full name for player's position
  switch(str,
         "C" = "center",
         "PF" = "power forward",
         "SF" = "small forward",
         "SG" = "shooting guard",
         "PG" = "point guard")
}

# Function to reformat the position column
reformat_position <- function(position) {
  # Functino for reformating the position column
  # input: position, the data column that need to be reformatted
  # output: the reforamtted position data column
  for(i in 1:length(position)){
    position[i] = reformat_abbreviated_position(position[i])
  }
  return(position)
}
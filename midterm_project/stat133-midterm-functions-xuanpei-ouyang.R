# Title: stat 133, fall 2016, midterm project
# Description: Functions used in the midterm project
# Author: Xuanpei Ouyang

# Function to extract height value (in meters)
extract_height = function(height_raw){
  # function for extract the numbers corresponding to the height value in 
  # meters. 
  # input: height_raw, a character vector with the metadata for the records
  # output: a numeric vector with the values for the records in meters
  
  # extract all the numbers
  height_vec = str_extract(height_raw, "[0-9.]+")
  return(as.numeric(height_vec))
}

# Function to extract athlete's name
extract_athlete = function(athlete_raw){
  # function for extracting the first and last names of the athletes 
  # input: athlete_raw, a vector contains the name of the athlete with the 
  #        country (inside parenthesis). 
  # output: a character vector with the first and last names of athletes.
  
  # extract everything before "(" and remove the space
  names_without_country = str_split(athlete_raw, "\\(", simplify = TRUE)[,1]
  formatted_names = character(0)
  for (i in 1:length(names_without_country)){
    formatted_names[i] = str_sub(names_without_country[i], start = 1, 
                                 end = nchar(names_without_country[i]) - 1)
  }
  return(formatted_names)
}

# Function to extract country name
extract_country = function(athlete_raw){
  # function for extracting the name of the countries
  # input, athlete_raw, a vector contains the name of the athlete with the
  #        country (inside parenthesis)
  # output: a character vector containing the initials of the countries 
  #         (without no parenthesis): e.g. "USA", "USA", "GBR"
  
  country_in_parenthesis = str_split(athlete_raw, "\\(", simplify = TRUE)[,2]
  formatted_countries = str_extract(country_in_parenthesis, "[A-Z]+")
  return(formatted_countries)
}

# Function to remove brackets (and numbers inside brackets)
remove_brackets = function(bracket_raw){
  # function for removing the brackets (and the numbers inside them), that 
  # input: bracket_raw, a character vector with brackets in its content 
  # output: a character vector with no brackets and no numbers inside the 
  # brackets).
  
  without_bracket = str_split(bracket_raw, "\\[", simplify = TRUE)[,1]
  return(without_bracket)
}

# Function to extract city name (just the city)
extract_city = function(place_raw){
  # function for extracting the city name from the column Place (for womens 
  # data)
  # input: place_raw, a metadata character vector with city and state names
  # output: a character vector with just the name of the city
  
  formatted_city_names = str_split(place_raw, ",", simplify = TRUE)[,1]
  return(formatted_city_names)
}

# Function to extract day number
extract_day = function(date_raw){ 
  # function for extracting the day number of the column Date
  # input: date_raw,  a character vector with date information
  # output: a numeric vector with day numbers
  
  day = str_split(date_raw, "\ ", simplify = TRUE)[,1]
  return(as.numeric(day))
}

# Function to extract month name
extract_month = function(date_raw){
  # function for extracting the name of the month from the column Date
  # input: date_raw, a character vector with date information
  # output: a character vector with the names of the months
  
  month = str_split(date_raw, "\ ", simplify = TRUE)[,2]
  return(month)
}

# Function to extract year number
extract_year = function(date_raw){
  # function for extracting the year number from the column Date
  # input: date_raw, a character vector with date information
  # output: a numeric vector with the year number
  
  year = str_split(date_raw, "\ ", simplify = TRUE)[,3]
  return(as.numeric(year))
}

# Function to reformat date (format "%d %B %Y)
reformat_date = function(date_raw){
  # function for reformating the date information
  # input: date_raw, a character vector with dat
  # output: a vector of class "Date" with format "%d %B %Y"
  
  dates_vector = paste(extract_day(date_raw), 
                    extract_month(date_raw), extract_year(date_raw))
  dates = as.Date(dates_vector, format = "%d %B %Y")
  return(dates)
}

# Extra Credit Function
# Function to convert height value units 
# My approach is to first convert meters to feet by multiplying 3.2808399 
# and take the integer part ofthe result as the value of feet. Then take the 
# reminder part of the result and convert it into inches by multiplying 12.
# Then, to find the fraction part of inches, I multiple the decimal inches 
# by 8, which is the largest denominator usually used for fraction inches.
# Then calculate and round the rest to its nearest 0.125 as the numerator 
# part of fraction and (8 is the denominator) and simplify fraction to get
# the correct fraction inches. Then finally passed all the parts of number
# into convert_height_units_string function to get the formatted string
# which containing all the information about the converted heights.
#
# I decided to implement this four part calculation into several lines of 
# calculation and sub-function. 
# Convert_height_units_string function is used for converting given input 
# of feets value, inches value and fraction inches into formatted string 
# with units.
# convert_height_units_numeric function is used for converting the height in
# meters into several numeric values in feets and inches. 
# simplify_fraction function is used for simplifying the fraction part of 
# height in inches.
# greatest_common_factor function is a helper function for simplify_fraction
# function
# round_to_fraction_inch is a helper function for rounding a decimal
# number to the nearest 0.125

convert_height_units_string = function(height_in_meters){
  # function for converting height units from parts of numbers to string
  # input: feet, a numeric value for height in feet integer part
  #        inch_int, a numeric value for height in inch integer part 
  #        inch_frac_numerator, a numeric value for height in inch fration
  #                             numerator part
  #        inch_frac_denominator, a numeric value for height in inch fration
  #                               denominator part
  # output: string value of height in feets and inches
  
  # get values for feet, inches, and fraction inches
  height_in_feets_inches = convert_height_units_numeric(height_in_meters)
  feet = height_in_feets_inches[1]
  inch_int = height_in_feets_inches[2]
  inch_frac_numerator = height_in_feets_inches[3]
  inch_frac_denominator = height_in_feets_inches[4]
  
  # format the feet string part
  height_string_in_feet_inches = paste(feet, "ft", inch_int)
  
  # deal with the edge case that the fraction part is 0, then ignore the 
  # fraction and add units directly. Else, format the fraction inches part
  # as well
  if(inch_frac_numerator != 0){
    fraction_string = paste0(inch_frac_numerator, "/", inch_frac_denominator)
    height_string = paste(height_string_in_feet_inches, fraction_string, "in")
  } else {
    height_string = paste(height_string_in_feet_inches, "in")  
  }
  
  return(height_string)
}

convert_height_units_numeric = function(height_in_meters){
  # function for converting values in meters to US customary units
  # input: height_in_meters, a numeric height value (in meters) 
  # output: a character vector in US customary units
  
  # calculate the feet and inch by taking the integer part of result
  height_in_feet_int = floor(height_in_meters * 3.2808399) 
  height_in_feet_decimal = (height_in_meters * 3.2808399) - height_in_feet_int 
  decimal_in_inch_int = floor(height_in_feet_decimal * 12)
  decimal_in_inch_decimal = (height_in_feet_decimal * 12) - decimal_in_inch_int
  rounded_inch = round_to_fraction_inch(decimal_in_inch_decimal)
  
  # deal with the edge case that inch_decimal is rounded to 1 when rounding 
  # it to its nearest 0.125
  if(rounded_inch == 1){
    decimal_in_inch_int = decimal_in_inch_int + 1
    inch_fraction_part = c(0, 0)
  } else {
    fraction_numerator = rounded_inch / 0.125
    inch_fraction_part = simplify_fraction(fraction_numerator, 8)
  }
  
  return(c(height_in_feet_int, decimal_in_inch_int, inch_fraction_part[1], 
           inch_fraction_part[2]))
}

round_to_fraction_inch = function(num){
  # function for rounding a decimal number to the nearest 0.125
  # input: num, a numeric value needed to be rounded
  # output: a value rounded to the nearest 0.125 
  
  round_num = 0.125 * round(num / 0.125)
  return(round_num)
}

simplify_fraction = function(numerator = 1, denominator = 1){
  # function for simplifing the fraction by dividing the greatest common factor
  # of numerator and denominator
  # input: numerator, a numeric value as numerator
  #        denominator, a numeric value as denominator
  # output: simplified_numerator, a numeric value as simplified_numerator
  #         simplified_denominator, a numeric value as simplified_denominator
  
  greatest_common_factor_fraction = 
       greatest_common_factor(numerator, denominator)
  
  # simplify fraction by dividing both numerator and denominator by their
  # greatest common factor
  simplified_numerator = numerator / greatest_common_factor_fraction
  simplified_denominator = denominator / greatest_common_factor_fraction
  return(c(simplified_numerator, simplified_denominator))
}

greatest_common_factor = function(first_number = 1, second_number = 1){
  # function for finding the greatest common factor between two numbers
  # input: first_number, a numeric value
  #        second_number, a numeric value
  # output: a numeric value as the greatest common factor
  
  # use while loop to divide second number from first number multiple times
  # to find the greatest common factor
  while(second_number > 0){
    temp_second_number = second_number
    second_number = first_number %% second_number
    first_number = temp_second_number
  }
  return(first_number)
}

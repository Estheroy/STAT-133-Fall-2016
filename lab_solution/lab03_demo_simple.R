# This is sample code prepared for STAT133 teaching purposes
# AUTHOR: Shamindra Shrotriya
# RESOURCES USED: Prof. Sanchez's materials from:
# https://github.com/ucb-stat133/stat133-fall-2016/tree/master/labs

# remove existing objects
rm(list = ls())
cat("\014")

# First we need to define the working directory
getwd()
setwd("/Users/shamindra/LEARNING/STUDY/UC_BERKELEY/STATISTICS/COURSES/MA_PROGRAM/CURRENT_COURSES/FALL_2016/STAT133/REPOS/STAT133_LABS/LABS/LAB03/DATA")
getwd()

# The following code to download the data is from:
# https://github.com/ucb-stat133/stat133-fall-2016/blob/master/labs/lab02-vectors.Rmd

# download RData file into your working directory
rdata <- "https://github.com/ucb-stat133/stat133-fall-2016/raw/master/data/usa-states.RData"
download.file(url = rdata, destfile = 'usa-states.RData')

# load data in your R session
load('usa-states.RData')

# list the available objects with ls()
# We have the following vectors loaded into environment
ls()

# Create a new dataframe called rsc_dat i.e. resources data
rsc_dat <- as.data.frame(cbind(state, capital, area, seats, water)
                         , stringsAsFactors = FALSE)

# Examine the data frame created - particularly column types
str(rsc_dat)

# Change column types
rsc_dat$area <- as.numeric(rsc_dat$area)
rsc_dat$seats <- as.numeric(rsc_dat$area)
rsc_dat$water <- as.numeric(rsc_dat$water)

# Re-examine the data frame
# Looks better now!
str(rsc_dat)

# Let's do some of the problems from last week using the vectors

# area of California
area[state == 'California']

# name of states with areas greater than 400,000 square km
state[area > 400000]

# name of states with areas between 100,000 and 125,000 square km
state[area > 100000 & area < 125000]

# name of the state with largest area
state[which(area == max(area))]

# name of the state with smallest area
state[which(area == min(area))]

# name of the state with largest number of seats
state[which(seats == max(seats))]

# capital of the state with the smallest water area
state[which(water == min(water))]

# create 'total
total  <- area + water

# No names assigned
names(total)

# Assign state names to total
names(total) <- state
total

# You should have a vector total with named elements.
# Now you can use character subsetting:
total["Alabama"]
total[c("California", "Oregon", "Washington")]
total[c("Texas", "Alaska")]

# Vectorization
# R Awesomeness - no need for looping
sqrt(area)

# Now we can go ahead and work with the data frame version

# Let's examine the data frame
str(object = rsc_dat)
nrow(rsc_dat)
ncol(rsc_dat)
dim(rsc_dat)
summary(rsc_dat)

# We can look at the top records
head(x = rsc_dat)

# The bottom records
tail(x = rsc_dat, n = 10)

# Get the column and row.names of the data frame
colnames(x = rsc_dat)
row.names(x = rsc_dat)

# Get column from a data frame
rsc_dat$area
typeof(rsc_dat$area)

head(rsc_dat$water)
head(water)

# We can subset the data frame in various ways
# VERY similar rules to vectors

# subset by POSITION
# Get the first 6 rows, all columns
rsc_dat[1:6, ]

# Get the first 6 rows, first 2 columns
rsc_dat[1:6, 1:2]

# Get the first rows 1, 3, 5, cols 3, 4
rsc_dat[c(1, 3, 5), c(3, 4)]

# Get the first rows 1, 3, 5, cols "area", "seats"
rsc_dat[c(1, 3, 5), c("area", "seats")]

# subset by RULE
rsc_dat[rsc_dat$area == max(rsc_dat$area), ]

# area of California
rsc_dat[state == 'California', c("area")]
rsc_dat[state == 'California', ]

# name of states with areas greater than 400,000 square km

# name of states with areas between 100,000 and 125,000 square km

# name of the state with largest area

# name of the state with smallest area

# name of the capital with largest number of seats

# capital of the state with the smallest water area

# We can easily create a new variable

# We can also do plotting

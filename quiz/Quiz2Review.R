# loead the package
library('ggplot')  

# search a specific function
help("+")
?"+"
help("vector")
?vector

# returns a list of functions and packages related with the searched term
??matrix
help.search("matrix")

# returns a list of functions containing the searched term
apropos("mean")

# return all the functions in a given package
help(package = "ggplot2")

# get a list of packages contained in R
# by specifying the lib.loc argument
library(lib.loc = .Library)

# find which package a function belongs
find("mean")
find("ggplot")

# 

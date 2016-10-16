# Clean up
rm(list = ls())
cat("\014")
dev.off()

### NAMED vectors

# Let's create a regular vector - no names
x <- c(56, 22)
x
names(x)

# Assign names to vector x
names(x) <- c("length", "area")
x
names(x)

# Access the vector using names
x["length"]
x["area"]

# LISTS - the most flexible data structure in R
# (and most programming languages!)
# Lists
l1 <- list("note",1,'the',2,"different",c(3,4),'types')
l1
names(l1)

# Access each element by position
l1[[1]]
l1[[7]]

# Named Lists Su
l2 <- list("area" = 56, "length" = 22)
l2
names(l2)

# Access contents by position
l2[[1]]
l2[[2]]

# Access by $name - this returns the actual element e.g. a vector
l2$area
l2$length

class(l2$area)
class(l2$length)
# Access by ["name"] - this returns a list containing the element
l2["area"]
l2["length"]

class(l2["area"])
class(l2["length"])

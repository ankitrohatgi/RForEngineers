# Basics of R
# To run this script:
# 1) Change working directory to this folder using setwd.
#    Example: setwd("~/Documents/Files")
# 2) Execute: source('basics.R')

# For help, just type: help(function name)
# Example: help(print)

# Printing
print("Basics of R")

# Concatenate text
cat("concatenated ", "text ", 123, "\n")

# Declare variables
x <- 1
y <- 10

cat("x: ", x, "\n")
cat("y: ", y, "\n")

# y^2
ySquare <- y^2
cat("y^2: ", ySquare, "\n")

# sqrt(y)
rooty <- sqrt(y)
cat("sqrt(y): ", rooty, "\n")

# vector
vec <- c(4, 10, 15)

# first element
elem <- vec[1]
cat('first element:\n')
print(elem)

# list
lst <- list(item1 = c(1,2,3), secondItem = "learn R")
cat("List:\n")
print(lst)

# list keys
cat('list keys:\n')
print(names(lst))

# list values
cat('Second item value:\n')
print(lst$secondItem)

# second item in list
cat('Second item in list:\n')
print(lst[2])

# value of second item in list
cat('Value of second item in list:\n')
print(lst[[2]])

# function
squareFn <- function(x) { 
    return(x^2) 
}

cat('Function:\n')
print(squareFn(100))

# for loop
cat('For loop:\n')
for(i in seq(1,10,1.5)) {
    print(i)
}

# while loop
cat('While loop:\n')
i = 1000
while(i >= 10) {
    print(i)
    i <- i - 100
}

# if else
cat('if else:\n')

str <- "hello"
if(str == "bye") {
    cat('bye')
} else {
    cat('hello')
}

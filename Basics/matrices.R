# Using matrices in R

# Simple matrix
# 3x3 matrices, defined row by row:
m1 <- matrix(c(1, 3, 5, 7, 11, 13, 17, 19, 23), 3, 3, TRUE)
m2 <- matrix(c(10, 11, 12, 13, 14, 15, 16, 17, 18), 3, 3, TRUE)

cat("m1:\n")
print(m1)

cat("m2:\n")
print(m2)

# Dimensions
dimM1 <- dim(m1)
cat('Dimensions of matrix:\n')
print(dimM1) # row column

# Sum of matrices
msum <- m1 + m2
cat("Matrix sum:\n")
print(msum)

# Add scalar to all elements
m1plus5 <- m1 + 5

cat("m1 + 5:\n")
print(m1plus5)

# Transpose
m1transpose <- t(m1)

cat("Matrix transpose:\n")
print(m1transpose)

# Determinant
detm1 <- det(m1)

cat("Determinant:\n")
print(detm1)

# Inverse
m1inv <- solve(m1)

cat("Matrix inverse:\n")
print(m1inv)
 
# Multiply element by element
elementMult <- m1 * m2

cat("Element by element multiplication:\n")
print(elementMult)

# Matrix multiplication
m1m2 <- m1 %*% m2

cat("Matrix multiplication\n")
print(m1m2)

# Solving a linear system 
# Ax = b

A <- m1
b <- c(1, 10, 100)

x <- solve(A, b)

cat("Solution of linear system:\n")
print(x)

# Basic calculus

# Single variable calculus

# 1. Definite Integral

# Define a function y = x
y <- function(x) { return(x) }

# Integrate from 0 to 100. 
z <- integrate(y, 0, 100)

print('1. Integral of y = x from 0 to 100: ')
print(z)

print(z$value) # z$value is the actual value. Checkout names(z) too.


# 2. Derivative

# Expression: y = cos(x)
y <- expression(cos(x))

# Differentiate
d <- D(y, "x")

# Set x
x <- 10

# Evaluate derivative
val <- eval(d)

print('2. Derivative of cos(x):')
print(d)
cat(' at x = ', x, ' =', val, '\n')

# 3. Partial Derivative

# Expression: z = x^2 + y^2 * x^6
z <- expression(x^2 + y^2*x^6)

print('3. Partial derivatives:')
print(D(z, "x")) # partial z/partial x
print(D(z, "y")) # partial z/partial y



# Complex Numbers

# 1. Define a complex number:

z <- complex(real = 2, imaginary = 1) # 2 + 1i

cat('1. z =', z, '\n')

# 2. Polar 
z <- complex(modulus = 5, argument = 0.1) # 5*exp^(0.1i)

cat('2. z =', z, '\n')

# 3. Or
z <- 5*exp(0.1i)

cat('3. z =', z, '\n')

# 4. Convert to complex
z <- as.complex(-1)

cat('4. Convert to complex:', z, '\n')

# 5. Or
z <- sqrt(as.complex(-1))

cat('5. Convert to complex:', z, '\n')

# 6. Re, Im, Mod, Arg, Conj:

cat('6.\n\tReal: ', Re(z), '\n')
cat('\tImaginary: ', Im(z), '\n')
cat('\tModulus: ', Mod(z), '\n')
cat('\tArgument: ', Arg(z), '\n')
cat('\tConjugate: ', Conj(z), '\n')


# Ordinary differential equations

# This requires a package called 'deSolve'. If the following line throws an error,
# then install 'deSolve' by typing:
#     install.packages('deSolve')
library(deSolve)

# This has been adapted from the example in the deSolve manual:

# Solve a coupled set of ODEs:
#
# dX/dt = a*X + Y*Z
# dY/dt = b*(Y-Z)
# dz/dt = -X*Y + c*Y - Z
# 
# t = 0 to 100 (time)
# and (a,b,c) are the parameters.

Lorentz <- function(t, state, parameters) {
    with(as.list(c(state, parameters)), {
        dX <- a*X + Y*Z
        dY <- b*(Y-Z)
        dZ <- -X*Y + c*Y - Z
        return(list(c(dX, dY, dZ)))
    })
}

parameters <- c(a = -8/3, b = -10, c = 28)

state <- c(X = 1, Y = 1, Z = 1) # Initial condition

times <- seq(0, 100, by = 0.01)

out <- ode(y = state, times = times, func = Lorentz, parms = parameters)

plot(out)

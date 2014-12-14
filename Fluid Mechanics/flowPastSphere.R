# Stokes flow past a sphere
# 
# Simple R script to plot fluid streamlines in a plane around a sphere in uniform stokes flow.
# 
# 
# Reference:
# MIT OpenCourseware: http://web.mit.edu/fluids-modules/www/low_speed_flows/2-5Stokes.pdf

rm(list=ls()) # clear all existing labels

# If the following packages are missing, then call 
# install.packages('deSolve') or install.packages('plotrix') to install.
library(deSolve)
library(plotrix)


# Helper function to convert cartesian coordinates to polar
toPolarCoord <- function(x, y, z) {
	r <- sqrt(x^2 + y^2 + z^2)
	theta <- atan2(sqrt(y^2+z^2), x)
	return(c(r = r, theta = theta))
}

# Helper function to convert polar coordinates to cartesian
toCartesianCoord <- function(r, theta) {
	x <- r*cos(theta)
	y <- 0 # we're just plotting in the plane y = 0
	z <- r*sin(theta)
	return(c(x = x, y = y, z = z))
}


# Flow field ('U' is the flow velocity magnitude and 'a' is the radius of the sphere)
flowPastSphere <- function(t, state, parameters) {
	with(as.list(c(state, parameters)), {
		uR <- U*cos(theta)*(1 - 3*a/(2*r) + a^3/(2*r^3))
		uTheta <- -U*sin(theta)*(1 - 3*a/(4*r) - a^3/(4*r^3))
		return(list(c(uR, uTheta)))	
	})
}

# Parameters: Uniform flow magnitude (U) and sphere radius (a):
parameters <- c(U = -1, a = 1)

z0 <- c(0.0005, 0.002, 0.005, 0.01, 0.02, 0.05, 0.1, 0.2, 0.5, 0.8, 1, 1.5) # list of z locations to start plotting the streamlines

# Save plot to an image:
png('flowPastSphere.png', width=800, height=400) 

# Initialize the plot
plot(NA, xlab='x', ylab='z', main='Stokes flow past a sphere', xlim=c(-5, 5), ylim=c(-2, 2), asp=1, cex.lab=1.5, cex.axis=1.5, cex.main=1.5, cex.sub=1.5)

# Loop through the initial 'z' positions of the streamlines and calculate the trajectories
for( zp in z0 ) {
	
	# Initial condition (r0, theta0) of the starting particle
	# Note, we are only looking at y = 0 plane
	state <- toPolarCoord(7, 0, zp)

	# Integration time
	times <- seq(0, 10/sqrt(zp), by = 0.1)

	# Solved coupled ODE to calculate the trajectory
	out <- ode(y = state, times = times, func = flowPastSphere, parms = parameters)
	
	len <- length(out[,1]) # length of first column (time)
	x <- vector(mode='numeric', length=len)
	z <- vector(mode='numeric', length=len)
	for(timeIndex in 1:len) {
		coord <- toCartesianCoord(out[timeIndex,'r'], out[timeIndex,'theta'])
		x[[timeIndex]] <- coord[1]
		z[[timeIndex]] <- coord[3]
	}
	
	lines(x, z, col='blue')	
	lines(x, -z, col='blue') # streamlines are symmetric about the z = 0 plane	
}
draw.circle(0, 0, 1) # draw the sphere
dev.off()

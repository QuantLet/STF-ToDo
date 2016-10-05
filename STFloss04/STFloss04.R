# ---------------------------------------------------------------------
# Book:         STF2
# ---------------------------------------------------------------------
# Quantlet:     STFloss04
# ---------------------------------------------------------------------
# Description:  STFloss04 plots three sample gamma pdfs, Gamma(alpha,
#               beta), on linear and Semi-logarithmic scales. Note, that
#               the first one (black solid line) is an exponential law,
#               while the last one (dashed blue line) is a chi-square
#               distribution with nu=6 degrees of freedom. It also plots
#               three sample log-normal pdfs, LogN(mu,sigma), on linear 
#               and semi-logarithmic plots. For small sigma the log-normal
#               diestribution resembles the Gaussian.
# ---------------------------------------------------------------------
# Usage:        -
# ---------------------------------------------------------------------
# See also:     STFloss01, STFloss02, STFloss03, STFloss05, STFloss06,
#               STFloss07, STFloss08, STFloss09, STFloss10
# ---------------------------------------------------------------------
# Inputs:       none
# ---------------------------------------------------------------------
# Output:       Plot of three sample gamma pdfs, Gamma(alpha,
#               beta), on linear and Semi-logarithmic scales. Note, that
#               the first one (black solid line) is an exponential law,
#               while the last one (dashed blue line) is a chi-square
#               distribution with nu=6 degrees of freedom. Second plot of
#               three sample log-normal pdfs, LogN(mu,sigma), on linear 
#               and semi-logarithmic plots. For small sigma the log-normal
#               diestribution resembles the Gaussian.           
# ---------------------------------------------------------------------
# Example:      -
# ---------------------------------------------------------------------
# Author:       Matlab: Joanna Janczura
#               R: Awdesch Melzer 20121006
# ---------------------------------------------------------------------

# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# gamma densities
step = 10

x = (1:(8*step))/step
y1 = dgamma(x,shape=1,scale=2)
y2 = dgamma(x,shape=2,scale=1)
y3 = dgamma(x,shape=3,scale=0.5)

# linear plot
plot(x, y1, col="black", type="l", lwd=2, xlab="x", ylab="PDF(x)", ylim=c(-0.01,0.6))
title("Gamma densities")
lines(x,y2,col="red3", lty=3,lwd=2)
lines(x,y3,col="blue3", lty=2, lwd=2);

# semi-logarithmic plot
dev.new()
plot(x,y1, log="y", col="black", type="l", lwd=2, xlab="x", ylab="PDF(x)", ylim=c(10e-4,10e-1))
par(new=T)
plot(x,y2, type="l", log="y", axes=F,frame=F,ylab="",xlab="",col="red3", lty=3,lwd=2,ylim=c(10e-4,10e-1))
par(new=T)
plot(x,y3, log="y", type="l", axes=F,frame=F,ylab="",xlab="",col="blue3", lty=2,lwd=2,ylim=c(10e-4,10e-1))
title("Gamma densities")

# log-normal densities
x=(1:(25*step))/step

y1=dlnorm(x,2,1)
y2=dlnorm(x,2,0.1)
y3=dlnorm(x,0.5,2)

# linear plot
dev.new()
plot(x, y1, col="black", type="l", lwd=2, xlab="x", ylab="PDF(x)", ylim=c(-0.01,0.6))
title("Log-normal densities")
lines(x,y2,col="red3", lty=3,lwd=2)
lines(x,y3,col="blue3", lty=2, lwd=2);

# semi-logarithmic plot

dev.new()
plot(x,y1, log="y", col="black", type="l", lwd=2, xlab="x", ylab="PDF(x)", ylim=c(10e-4,10e-1))
par(new=T)
plot(x,y2, type="l", log="y", axes=F,frame=F,ylab="",xlab="",col="red3", lty=3,lwd=2,ylim=c(10e-4,10e-1))
par(new=T)
plot(x,y3, log="y", type="l", axes=F,frame=F,ylab="",xlab="",col="blue3", lty=2,lwd=2,ylim=c(10e-4,10e-1))
title("Log-normal densities")

# ------------------------------------------------------------------------------
# Book:         STF
# ------------------------------------------------------------------------------
# Quantlet:     STF2tvch02
# ------------------------------------------------------------------------------
# Description:  STF2tvch02 plots the data and the GARCH volatility forecast based on all historical data
#               
# ------------------------------------------------------------------------------
# Usage:        -
# ------------------------------------------------------------------------------
# Inputs:       None      
# 
#				Please change working directory
#
------------------------------------------------------------------------------
# Output:       Plot of data and the GARCH volatility forecast based on all historical data           
# ------------------------------------------------------------------------------
# Example:      -
# ------------------------------------------------------------------------------
# Author:       Pavel Cizek 20110715
# ------------------------------------------------------------------------------

# Plots the data and the GARCH volatility forecast based on all historical data

# Close windows and clear variables
rm(list=ls(all=TRUE))
graphics.off()

#Load library
install.packages(c("aws", "fGarch", "igraph", "Hmisc"))
library("fGarch")
library("igraph")
library("stats")
library("Hmisc")

# Please change working directory
setwd("C:/")
data <- read.delim2("SP1997-2005s.txt")

time <- (1:length(data[,1]))
dat0 <- data[,1] - c(mean(data[,1]))
dat0 <- dat0 / sd(dat0)

h <- 1
pred   <- 0*time - 1

for (i in 1076:2088)
{
     print(i)

     gest <- garchFit(~ garch(1,1), data = dat0[1:(i-1)], trace = FALSE, include.mean=FALSE)
     pred[i] <- predict(gest, n.ahead = h)$standardDeviation^2
}

timet <- (time - 1078)/250 + 2001
plot(timet[pred>=0],dat0[pred>=0]^2,cex=0.2,xaxp=c(2001,2005,4), xlab="Time", ylab="Squared log-returns")
lines(timet[pred>=0],pred[pred>=0])
minor.tick(4,5)


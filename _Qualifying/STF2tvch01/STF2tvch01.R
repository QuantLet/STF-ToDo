# ------------------------------------------------------------------------------
# Book:         STF
# ------------------------------------------------------------------------------
# Quantlet:     STF2tvch01
# ------------------------------------------------------------------------------
# Description:  STF2tvch01 plots the daily log-returns of S&P 500 in year 2001--2005
#               
# ------------------------------------------------------------------------------
# Usage:        -
# ------------------------------------------------------------------------------
# Inputs:       None      
# 
#				Please change working directory
#
------------------------------------------------------------------------------
# Output:       Plots of daily log-returns of S&P 500 in year 2001-2005           
# ------------------------------------------------------------------------------
# Example:      -
# ------------------------------------------------------------------------------
# Author:       Pavel Cizek 20110715
# ------------------------------------------------------------------------------



# Plots the daily log-returns of S&P 500 in year 2001--2005


#Clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

#Please change working directory
setwd("C:/...")
data <- read.delim2("SP1997-2005s.txt")

time <- (1:length(data[,1]))
dat0 <- data[,1] - c(mean(data[,1]))
dat0 <- dat0 / sd(dat0)

timet <- (time - 1078)/250 + 2001
plot(timet[time>=1075],dat0[time>=1075],xaxp=c(2001,2005,4), xlab="Time", ylab="Log-returns",type="l")


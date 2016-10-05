# ---------------------------------------------------------------------
# Book:         STF2
# ---------------------------------------------------------------------
# Quantlet:     STFloss08
# ---------------------------------------------------------------------
# Description:  STFloss08 plots the empirical mean excess function e_n(x)
#               for the Danish fire loss data (dfl.txt).
# ---------------------------------------------------------------------
# Usage:        -
# ---------------------------------------------------------------------
# See also:     STFloss01, STFloss02, STFloss03, STFloss04, STFloss05,
#               STFloss06, STFloss07, STFloss08t, STFloss09, STFloss10
# ---------------------------------------------------------------------
# Inputs:       none
# ---------------------------------------------------------------------
# Output:       Plot of the empirical mean excess function e_n(x)
#               for the Danish fire loss data (dfl.txt).              
# ---------------------------------------------------------------------
# Example:      -
# ---------------------------------------------------------------------
# Author:       Matlab: Joanna Janczura
#               R: Awdesch Melzer 20121008
# ---------------------------------------------------------------------

# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

samplemef = function(data, xaxis){
# SAMPLEMEF Sample mean excess function. 
#   RES = SAMPLEMEF (DATA, XAXIS) returns the value of the sample 
#   mean excess function for the vector DATA in the points from vector XAXIS.


sorteddata  = sort(data)
dataLength  = length(sorteddata)
resLength   = length(xaxis)
res         = xaxis


i = 0
valuesOnTheLeft = 0
smef = mean(sorteddata[1:dataLength])

while ( i < resLength ){
  i = i + 1
  while (sorteddata[valuesOnTheLeft+1] < xaxis[i]){
    valuesOnTheLeft = valuesOnTheLeft + 1
  }
  smef = mean (sorteddata[(valuesOnTheLeft+1):dataLength])
  res[i] = smef - xaxis[i]
}
return(res)
}


# load the data
data = read.table("dfl.txt")
data = data[,5]
xaxis = sort(data)

# calculate empirical mean excess function on dfl data
sampleMef = samplemef(data, xaxis)
sampleMef = sampleMef / 1e6

xaxis = xaxis / 1e6

plot(xaxis,sampleMef, col="black",xlab="x (DKK million)", ylab="e_n(x) (DKK million)", xlim=c(0,18),ylim=c(0,max(sampleMef)))

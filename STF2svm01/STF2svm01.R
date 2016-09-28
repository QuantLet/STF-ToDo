# ------------------------------------------------------------------------------
# Book:               	STF2
# ------------------------------------------------------------------------------
# Quantlet:           	STF2svm01
# ------------------------------------------------------------------------------
# Description:        	STF2svm01 plots the area of two different groups. It refers to the 
#                     	four plots in the SVM chapter.
# ------------------------------------------------------------------------------
# Usage:         		-
# ------------------------------------------------------------------------------
# Inputs:         	    G        - Data Matrix, needs to include labels
#                       x1       - First variable to be drawn on the 2 Dim. plot (scalar)
#                       x2       - Second variable drawn on the 2 Dim. plot
#                		y        - Indicates the column number where the lables are stored
#                          in D
#                       c         - Capacity constraint
#                       sig       - prior for RBF kernel
# ------------------------------------------------------------------------------
# Output:         	Four 2-DIm Plot of a svm classification. The RBF kernel and hinge
#                		loss are used. The triangles represent solvent (y = -1) and  
#                		circles represent insolvent companies (y = +1).
#                		The shaded object represent the support vectors. The colored #                background
#		 		corresponds to different score values $f$. The bluer 
#                		the area, the higher the score (y= +1). Most successful companies
#                		(y=-1) are in the red area. 
# ---------------------------------------------------------------------
# Example:        	stf2svm01(G,28,7,3,1,100) - produces Figure 8
#                 	stf2svm01(G,28,7,3,1,2) - produces Figure 9     
#                 	stf2svm01(G,28,7,3,1,1/2) - produces Figure 10 
#                 	stf2svm01(G,28,7,3,200,2) - produces Figure 11 
# ------------------------------------------------------------------------------
# Author:             	Linda Hoffmann 20100208,
#                       Edit: Awdesch Melzer 20131015
# ------------------------------------------------------------------------------

graphics.off()
rm(list=ls(all=TRUE))

# load required packages
install.packages('kernlab')
install.packages('quadprog')
install.packages('zoo')
install.packages('tseries')
library(kernlab)
library(quadprog)
library(zoo)
library(tseries)

#setwd('C:/Users/...')  #set your working direktory

x1  = 28
x2  = 7
y   = 3
C   = c(1,1,1,200)
sig = c(100,2,0.5,2)

G   = read.matrix("Training100by100noNA.txt", header =TRUE, sep="")

stf2svm01 = function(G,x1,x2,y,C,sig){
#g = data.frame(x2=G[,x2], x1=G[,x1],y=G[,y])

# Calculate the score values for each company
scores <- ksvm(G[,c(x2,x1)],G[,y],type = "C-svc", kernel = "rbfdot",
        kpar = list(sigma = 1/sig),C = C)

# Make a 2-Dim plot

plot(scores, data=G[,c(x2,x1,y)])
}


for (i in 1:4){
	dev.new()
	stf2svm01(G=G,x1=x1,x2=x2,y=y,C=C[i],sig=sig[i])
}


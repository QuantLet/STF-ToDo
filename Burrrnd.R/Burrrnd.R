# -----------------------------------------------------------------
# Book:          STF
# -----------------------------------------------------------------
# See also:      simNHPPALP
# -----------------------------------------------------------------
# Quantlet:      Burrrnd
# -----------------------------------------------------------------
# Description:   Burrrnd generates a vector of pseudo random variables 
#                 with Burr distribution.
# -----------------------------------------------------------------
# Usage:         y = Burrrnd (alpha, lambda, tau, n, m)
# -----------------------------------------------------------------
#   Input:
#     Parameter:   n
#     Definition:  integer, number of rows
#     Parameter:   m
#     Definition:  integer, number of columns
#     Parameter:   alpha
#     Definition:  scalar, parameter of Burr distribution
#     Parameter:   lambda
#     Definition:  scalar, parameter of Burr distribution
#     Parameter:   tau
#     Definition:  scalar, parameter of Burr distribution
# -----------------------------------------------------------------
#   Output
#     Parameter:   y
#     Definition:  n x m matrix, pseudo random numbers 
# -----------------------------------------------------------------
# Example:     set.seed(100)
#              Burrrnd(3,2,1,3,2)
# -----------------------------------------------------------------
# Result    
#              Contents of y
#              [1,] 0.9622592 3.2157114
#              [2,] 1.1429729 0.5750059
#              [3,] 0.4376187 0.5477108
# -----------------------------------------------------------------
# Keywords:     random number generation
# -----------------------------------------------------------------
# Author:       Awdesch Melzer 20130628
# -----------------------------------------------------------------
Burrrnd = function(alpha,lambda,tau,n,m){
	
  if (missing(m)){
    m      = 1
  }
  if (missing(n)){
    n      = 1
  }
  if (missing(tau)){
    tau    = 2
  }
  if (missing(lambda)){
    lambda = 1
  }
  if (missing(alpha)){
    alpha  = 1
  }
   u = matrix(0,n,m)
   for (i in 1:m){
   	   u[,i] = (lambda*(runif(n,0,1)^(-1/alpha)-1))^(1/tau)
   }
   y = u
return(y)
}

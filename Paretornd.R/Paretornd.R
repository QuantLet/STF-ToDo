# -----------------------------------------------------------------
#   Book:          STF
# -----------------------------------------------------------------
#   See also:      -
# -----------------------------------------------------------------
#   Quantlet:      Paretornd
# -----------------------------------------------------------------
#   Description:   Paretornd generates a vector of pseudo random 
#                  variables with Pareto distribution.
# -----------------------------------------------------------------
#   Usage:         y = Paretornd(alpha, lambda, n, m)
# -----------------------------------------------------------------
#   Input:
#     Parameter:   n
#     Definition:  integer, number of rows
#     Parameter:   m
#     Definition:  integer, number of columns
#     Parameter:   alpha
#     Definition:  scalar, parameter of Pareto distribution
#     Parameter:   lambda
#     Definition:  scalar, parameter of Pareto distribution
# -----------------------------------------------------------------
#   Output:
#     Parameter:   y
#     Definition:  n x m matrix, pseudo random numbers 
# -----------------------------------------------------------------
#   Example:      set.seed(100)
#                 Paretornd(3/2,1/2,3,2)
# -----------------------------------------------------------------
#   Result:    
#    	           Contents of y
#                [1,] 0.5968725 2.9004556
#                [2,] 0.7347848 0.3288320
#                [3,] 0.2427481 0.3113538 
# -----------------------------------------------------------------
# Keywords:     random number generation
# -----------------------------------------------------------------
# Author:        Awdesch Melzer 20130628
# -----------------------------------------------------------------
Paretornd = function(alpha,lambda,n,m){
  if (missing(m)){
    m      = 1
  }
  if (missing(n)){
    n      = 1
  }
  if (missing(lambda)){
    lambda = 1
  }
  if (missing(alpha)){
    alpha  = 1
  }
  u = matrix(0,n,m)
  for (i in 1:m){
  	u[,i] = lambda*(runif(n,0,1)^(-1/alpha)-1)
  }
  y = u
  return(y)
}
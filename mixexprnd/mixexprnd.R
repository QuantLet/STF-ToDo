# -----------------------------------------------------------------
#   Book:         STF
# -----------------------------------------------------------------
#   See also:     Burrrnd
# -----------------------------------------------------------------
#   Quantlet:     mixexprnd
# -----------------------------------------------------------------
#   Description:  mixexprnd generates a vector of pseudo random variables 
#                 with mixture of exponentials distributions.
# -----------------------------------------------------------------
#   Usage:         y = mixexprnd(alpha, beta1, beta2, n, m)
# -----------------------------------------------------------------
#   Input:
#     Parameter:  n
#     Definition: integer, number of rows
#     Parameter:  m
#     Definition: integer, number of columns
#     Parameter:  alpha
#     Definition: scalar, parameter of mixture of exponentials distribution
#     Parameter:  beta1
#     Definition: scalar, parameter of mixture of exponentials distribution
#     Parameter:  beta2
#     Definition: scalar, parameter of mixture of exponentials distribution
# -----------------------------------------------------------------
#   Output:
#     Parameter:  y
#     Definition: n x m matrix, pseudo random numbers
# -----------------------------------------------------------------
#   Example:      set.seed(100)
#                 mixexprnd(0.2,2,1,3,2)
# -----------------------------------------------------------------
#   Result:   
#    	           Contents of y
#               [1,] 0.62480524 1.7483908
#               [2,] 1.17442933 0.2499930
#               [3,] 0.09311719 0.1943265 
# -----------------------------------------------------------------
# Keywords:     random number generation
# -----------------------------------------------------------------
# Author:       Awdesch Melzer 20130628
# -----------------------------------------------------------------

mixexprnd = function(p,beta1,beta2,n,m){

  if (missing(p)){
      p     = 0.5
  }
  if (missing(beta1)){
      beta1 = 1
  }
  if (missing(beta2)){
      beta2 = 2
  }
  y   = rexp(n*m,rate=(1/beta2))
  aux = which(runif(n*m,0,1)<=p)  

      if(!missing(aux)){
          y[aux]=rexp(length(aux),1/beta1)
      }

  y=matrix(y,n,m)
  return(y)
  }

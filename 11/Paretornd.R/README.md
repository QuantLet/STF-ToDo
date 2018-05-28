[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **Paretornd** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: Paretornd

Published in: Statistical Tools for Finance and Insurance

Description: 'Generates a vector of pseudo random variables coming from a Pareto distribution.'

Keywords: random-number-generation, pareto, distribution, stochastic, random

See also: 'BondCoupon, BondZeroCouponHPP, Burrrnd, STFcat04, STFcat05, STFcat06, STFcat07, STFcat08, STFcat09, mixexprnd, simHPPALP, simNHPPALP'

Author: Awdesch Melzer

Submitted: Sun, June 30 2013 by Awdesch Melzer

Input: 'ninteger- number of rows
	minteger- number of columns
	alphascalar- parameter of Pareto distribution
	lambdascalar- parameter of Pareto distribution'

Output: 'yn x m- matrix, pseudo random numbers'

Example: 'y = Paretornd(alpha, lambda, n, m)
          set.seed(100)
          Paretornd(3/2,1/2,3,2)

          Result: Contents of y
          [1,] 0.5968725 2.9004556
          [2,] 0.7347848 0.3288320
          [3,] 0.2427481 0.3113538'
```

### R Code
```r

Paretornd = function(alpha,lambda,n,m){
#PARETORND Random arrays from Pareto distribution.
#   Y = PARETORND(ALPHA,LAMBDA,N,M) returns an M-by-N array of random numbers 
#   chosen from the Pareto distribution with parameters ALPHA, LAMBDA.
#
#   The default values for ALPHA, LAMBDA, N, M 1, 1, 1, 1, respectively.
#
#   PARETORND uses the inversion method.

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
```

automatically created on 2018-05-28
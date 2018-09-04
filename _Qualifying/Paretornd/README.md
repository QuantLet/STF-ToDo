[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **Paretornd** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: Paretornd 

Published in: Statistical Tools for Finance and 

Description: 'Generates random arrays from a Pareto distribution. A function required by STFloss10'

Keywords: 'random, random-number-generation, pareto, heavy-tailed, distribution,stochastic'

Description: 'Generates a vector of pseudo random variables coming from a Pareto distribution.'

Author: Joanna Janczura

See also: STFloss08t, STFloss10

Submitted: Tue, October 09 2012 by Dedy Dwi Prastyo

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

automatically created on 2018-09-04

### MATLAB Code
```matlab

function y=Paretornd(alpha,lambda,n,m)
%PARETORND Random arrays from Pareto distribution.
%   Y = PARETORND(ALPHA,LAMBDA,N,M) returns an M-by-N array of random numbers 
%   chosen from the Pareto distribution with parameters ALPHA, LAMBDA.
%
%   The default values for ALPHA, LAMBDA, N, M 1, 1, 1, 1, respectively.
%
%   PARETORND uses the inversion method.

  if nargin<4
    m=1;
  end
  if nargin<3
    n=1;
  end
  if nargin<2
    lambda=1;
  end
  if nargin<1
    alpha=1;
  end
 
  y=lambda*(rand(n,m).^(-1/alpha)-1);

```

automatically created on 2018-09-04
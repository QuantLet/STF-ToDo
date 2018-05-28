[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **Burrrnd** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: Burrrnd 

Published in: Statistical Tools for Finance and Insurance

Description: 'Calculates random numbers from Burr-Distribution. The default values for the parameters ALPHA, LAMBDA, TAU, M, N are 1, 1, 2, 1, 1 respectively. Uses the inversion method. Required by STFloss10'

Keywords: random-number-generation, random, continuous, univariate, heavy-tailed

Author: Joanna Janczura

See also: STFloss08t, STFloss10

Submitted: Tue, October 09 2012 by Dedy Dwi Prastyo

Input: 'nscalar- integer, number of rows
	mscalar- integer, number of columns
	alphascalar- parameter of Burr distribution
	lambdascalar- parameter of Burr distribution
	tauscalar- parameter of Burr distribution'

Output: 'yn x m- matrix, pseudo random numbers'

Example: 'y = Burrrnd (alpha, lambda, tau, n, m)
	  set.seed(100)
	  Burrrnd(3,2,1,3,2)

	  Result: Contents of y
	  [1,] 0.9622592 3.2157114
	  [2,] 1.1429729 0.5750059
	  [3,] 0.4376187 0.5477108'
```

### R Code
```r

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

```

automatically created on 2018-05-28

### MATLAB Code
```matlab

function y=Burrrnd(alpha,lambda,tau,n,m)
%BURRRND Random arrays from Burr distribution.
%   R = BURRRND(ALPHA,LAMBDA,TAU,N,M) returns an M-by-N array of random numbers 
%   chosen from the Burr distribution with parameters ALPHA, LAMBDA, TAU.
%
%   The default values for the parameters ALPHA, LAMBDA, TAU, M, N are
%   1, 1, 2, 1, 1, respectively.
%
%   BURRRND uses the inversion method.


  if nargin<5
    m=1;
  end
  if nargin<4
    n=1;
  end
  if nargin<3
    tau=2;
  end
  if nargin<2
    lambda=1;
  end
  if nargin<1
    alpha=1;
  end
  
  y=(lambda*(rand(n,m).^(-1/alpha)-1)).^(1/tau);


```

automatically created on 2018-05-28
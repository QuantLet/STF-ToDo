[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **mixexprnd** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: mixexprnd

Published in: Statistical Tools for Finance and Insurance

Description: 'Generates a vector of pseudo random variables with mixture of exponentials distributions. Required by STFloss10'

Keywords: random-number-generation, exponential, distribution, random, loss function

See also: 'STFloss10, BondCoupon, BondZeroCouponHPP, Burrrnd, Paretornd, STFcat04, STFcat05, STFcat06, STFcat07, STFcat08, STFcat09, simHPPALP, simNHPPALP'

Author: Awdesch Melzer

Submitted: Sun, June 30 2013 by Awdesch Melzer

Input: 'ninteger: number of rows
        minteger: number of columns
        alphascalar: parameter of mixture of exponential distribution
        beta1scalar: parameter of mixture of exponential distribution
        beta2scalar: parameter of mixture of exponential distribution'

Output: 'yn x m-matrix, pseudo random numbers'

Example: 'y = mixexprnd(alpha, beta1, beta2, n, m)
          set.seed(100)
          mixexprnd(0.2,2,1,3,2)
          Result: Contents of y
          [1,] 0.62480524 1.7483908
          [2,] 1.17442933 0.2499930
          [3,] 0.09311719 0.1943265'


```

### R Code
```r

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

```

automatically created on 2018-05-28

### MATLAB Code
```matlab

function y=mixexprnd(p,beta1,beta2,n,m)
%MIXEXPRND Random arrays from the mixed exponential distribution.
%   Y = MIXEXPRND(P,BETA1,BETA2,N,M) returns an M-by-N array of random numbers 
%   chosen from the mixed exponential distribution with parameters P, BETA1, BETA2.
%
%   The default values for A, BETA1, BETA2, N, M are 0.5, 1, 2, 1, 1,
%   respectively.
%
%   MIXEXPRND uses the exponential number generator.

  if nargin<1
      p=.5;
  end
  if nargin<2
    beta1=1;
  end
  if nargin<3
    beta2=2;
  end
  y=exprnd(1/beta2,n*m,1);
  aux=find(rand(n*m,1)<=p);
  if(~isempty(aux))
    y(aux)=exprnd(1/beta1,size(aux));
 end
  y=reshape(y,n,m);

```

automatically created on 2018-05-28
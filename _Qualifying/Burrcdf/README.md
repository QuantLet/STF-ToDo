[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **Burrcdf** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: Burrcdf 

Published in: Statistical Tools for Finance and Insurance

Description: 'Returns the cumulative density distribution of the Burr distribution. The default parameters are: ALPHA  = 1, LAMBDA = 1, TAU = 2.  Required by STFloss08t.'

Keywords: cdf, distribution, continuous, univariate, heavy-tailed

Author: Joanna Janczura

See also: STFloss08t

Submitted: Tue, October 09 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function y=Burrcdf(x,alpha,lambda,tau,control)
%BURRCDF Burr cumulative distribution function.
%   Y = BURRCDF(X,ALPHA,LAMBDA,TAU, CONTROL) returns the cdf of the Burr 
%   distribution with parameters ALPHA,LAMBDA,TAU, evaluated at the values in X.
%   For CONTROL=0 the error message is displayed, if the parmeters are
%   negative.
%   
%   The default values for the parameters ALPHA, LAMBDA, TAU, CONTROL are
%   1, 1, 2, 0, respectively.

  if nargin<5
    control=0;
  end
  if nargin<4
     tau=2;
  end 
  if nargin<3
    lambda=1;
  end
  if nargin<2
    alpha=1;
  end
  if(control==0)
        if(alpha<=0)
            error('Non-positive tau!');
        end
        if(lambda<=0)
            error('Non-positive lambda!');
        end
        if(tau<=0)
            error('Non-positive alpha!');
        end
  end

 
  y=zeros(size(x));
  pos=find(x>0);
  y(pos)=1-(lambda./(lambda+(x(pos)).^tau)).^alpha;


```

automatically created on 2018-05-28
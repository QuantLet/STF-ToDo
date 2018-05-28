[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **Paretocdf** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLEt: Paretocdf 

Published in: Statistical Tools for Finance and Insurance

Description: 'Returns cumulative distribution function (cdf) of a pareto distribution. A function required by STFloss08t.'

Keywords: cdf, pareto, distribution, generalized-pareto-model, quantile, probability, heavy-tailed

Author: Joanna Janczura

See also: STFloss08t

Submitted: Tue, October 09 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function y=Paretocdf(x,alpha,lambda,control)
%PARETOCDF Pareto cumulative distribution function.
%   Y = PARETOCDF(X,ALPHA,LAMBDA, CONTROL) returns the cdf of the Pareto
%   distribution with parameters ALPHA, LAMBDA, evaluated at the values in X.
%   For CONTROL=0 the error message is displayed, if the parmeters are
%   negative.
%   
%   The default values for ALPHA, LAMBDA and CONTROL are 1, 1, 0, respectively.

  if nargin<4
    control=0;
  end
  if nargin<3
    lambda=1;
  end
  if nargin<2
    alpha=1;
  end
  if(control==0)
      if lambda<=0
        error('Non-positive lambda!');
      end
      if alpha<=0
        error('Non-positive alpha!');
      end
  end

  y=zeros(size(x));
  positive=find(x>0);
  y(positive)=1-(lambda./(lambda+x(positive))).^alpha;

```

automatically created on 2018-05-28
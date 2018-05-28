[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **Paretopdf** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: Paretopdf 

Published in: Statistical Tools for Finance and Insurance

Description: 'Returns probability density function for pareto distribution.
A function required by STFloss05.'

Keywords: pdf, pareto, distribution, generalized-pareto-model, probability, heavy-tailed

Author: Joanna Janczura

See also: STFloss01, STFloss02, STFloss03, STFloss04, STFloss05

Submitted: Tue, October 09 2012 by Dedy Dwi Prastyo


```

### MATLAB Code
```matlab

function y=Paretopdf(x,alpha,lambda)
%PARETOPDF Pareto probability density function (pdf).
%   Y = PARETOPDF(X,ALPHA,LAMBDA) returns the pdf of the Pareto
%   distribution with parameters ALPHA, LAMBDA, evaluated at the values in X.
%   For CONTROL=0 the error message is displayed, if the parmeters are
%   negative.
%   
%   The default values for ALPHA, LAMBDA and CONTROL are 1, 1, 0, respectively.


  if nargin<3
    lambda=1;
  end
  if nargin<2
    alpha=1;
  end
  if nargin<1
      error('stats:normpdf:TooFewInputs','Input argument X is undefined.');
  end
  if lambda<=0
      error('Non-positive sigma!');
  end
  if alpha<=0
      error('Non-positive alpha!');
  end
  y=zeros(size(x));
  pos=find(x>0); 
  y(pos)=alpha*lambda^alpha./(lambda+x(pos)).^(alpha+1);
  


```

automatically created on 2018-05-28
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **mixexppdf** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: mixexppdf

Published in: Statistical Tools for Finance and Insurance

Description: 'Returns a mixed exponential probability density function (pdf).
A function required by STFloss03.m'

Keywords: pdf, probability, density, exponential, quantile

Author: Joanna Janczura

See also: STFloss03

Submitted: Tue, October 09 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function y=mixexppdf(x,alpha,beta1,beta2,control)
%MIXEXPPDF Mixed exponential probability density function (pdf).
%   Y = MIEXEXPPDF(X,ALPHA,BETA1,BETA2) returns the pdf of the mixed
%   exponential distribution with mixing probability A and distributions 
%   parameters BETA1, BETA2, evaluated at the values in X.
%   For CONTROL=0 the error message is displayed, if the parmeters are
%   negative or a>1.
%   
%   The default values for A, BETA1, BETA2 and CONTROL are 0.5, 1, 2, 0
%   respectively.


  if nargin<5
      control=0;
  end
  if nargin<2
      a=.5;
  end
  if nargin<3
    b1=1;
  end
  if nargin<4
    b2=2;
  end
  if(control==0)
      if beta1<=0
        error('Non-positive beta1!');
      end
      if beta2<=0
        error('Non-positive beta2!');
      end  
      if alpha<=0
          error('Alpha lesser or equal 0!');
      end
      if alpha>=1
          error('Alpha greater or equal 1!');
      end
  end

  
  y=zeros(size(x));
  pos=find(x>0);
  y(pos)=alpha*beta1*exp(-beta1*x(pos))+(1-alpha)*beta2*exp(-beta2*x(pos));

```

automatically created on 2018-05-28
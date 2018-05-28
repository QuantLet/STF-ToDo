[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **hypcdf** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: hypcdf

Published in: Statistical Tools for Finance and Insurance

Description: 'Contains the hyperbolic cumulative distribution function (cdf). Required by STFstab05.m and STFstab06.m function.'

Keywords: cdf, distribution, hyperbolic, continuous, probability

See also: STFstab05, STFstab06

Author: Rafal Weron

Submitted: Tue, September 18 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function y=hypcdf(x,alpha,beta,delta,mu,starti);
%HYPCDF Hyperbolic cumulative distribution function (cdf).
%   Y=HYPCDF(X,ALPHA,BETA,DELTA,MU,STARTI) returns the cdf of the hyperbolic  
%   distribution with shape parameter ALPHA, skewness parameter BETA, 
%   scale parameter DELTA and location parameter MU, evaluated at the 
%   values in X. STARTI is an optional parameter specifying the starting
%   point for the integration scheme.
%
%   Reference(s):
%	[1] R.Weron (2004) "Computationally intensive Value at Risk 
%   calculations", in "Handbook of Computational Statistics: Concepts and 
%   Methods", eds. J.E. Gentle, W. Haerdle, Y. Mori, Springer, Berlin, 
%   911-950. 
%   [2] R.Weron (2007) "Modeling and Forecasting Electricity Loads and 
%   Prices: A Statistical Approach", Wiley, Chichester.   

%   Written by Adam Misiorek and Rafal Weron (2006.09.22)
%   Copyright (c) 2006 by Rafal Weron

% Convert to a column vector
x = x(:);


% Find the starting point for the integration scheme
feps = 1e-10;
if nargin < 6
    starti = mu+beta*delta/sqrt(alpha^2+beta^2)*besselk(1+1,delta*sqrt(alpha^2-beta^2))/besselk(1,delta*sqrt(alpha^2-beta^2));
    starti = min(starti,min(x))-1;
    while hyppdf(starti,alpha,beta,delta,mu)>feps
        starti = starti-1;
    end;
end;

n = length(x);
y = zeros(n,1);
[x,ind] = sort(x);
ind = sortrows([ind,(1:n)'],1);
ind = ind(:,2);
x = [starti;x];
warning off MATLAB:quadl:MinStepSize
% Integrate the hyperbolic pdf
for i=1:n
    y(i) = quadl('hyppdf',x(i),x(i+1),[],[],alpha,beta,delta,mu);
end;
warning on MATLAB:quadl:MinStepSize
y = cumsum(y);
y = y(ind);
y(y<0) = 0;%security
y(y>1) = 1;
```

automatically created on 2018-05-28
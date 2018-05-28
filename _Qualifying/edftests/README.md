[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **edftests** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: edftests

Published in: Statistical Tools for Finance and Insurance

Description: 'Contains the empirical distribution function (edf) goodness-of-fit statistics. Required by STFstab05.m and STFstab06.m function. Computes the Anderson-Darling A2 and Kolmogorov (Kolmogorov-Smirnov) D goodness-of-fit statistics for a given data vector X and a vector of estimated parameters of one of the following distributions: Gaussian, hyperbolic, NIG, stable.'

Keywords: edf, Kolmogorov-Smirnov test, distribution, normal, hyperbolic, stable distribution

See also: STFstab05, STFstab06

Author: Rafal Weron

Submitted: Tue, September 18 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function [A2,D]=edftests(x,params,dist);
%EDFTESTS Empirical distribution function (edf) goodness-of-fit statistics.
%	[A2,D]=EDFTESTS(X,PARAMS,DIST) computes the Anderson-Darling A2 and
%   Kolmogorov (Kolmogorov-Smirnov) D goodness-of-fit statistics for data 
%   vector X and a vector of estimated parameters PARAMS of distribution 
%   DIST ('Gaussian', 'hyperbolic', 'NIG', 'stable'). 
%
%   Reference(s):
%   [1] R.B.D’Agostino, M.A.Stephens (1986) "Goodness-of-Fit Techniques", 
%   Marcel Dekker, New York.
%   [2] K.Burnecki, A.Misiorek, R.Weron (2005) "Loss distributions", in 
%   "Statistical Tools for Finance and Insurance", P.Cizek, W.Haerdle, 
%   R.Weron (eds), Springer, Berlin, pp. 289–317. 

%   Written by Adam Misiorek and Rafal Weron (2006.09.22)
%   Copyright (c) 2006 by Rafal Weron

warning('off','all')
switch dist
    case 'hyperbolic'
        z=hypcdf(x,params(1),params(2),params(3),params(4));
    case 'NIG'
        z=nigcdf(x,params(1),params(2),params(3),params(4));
    case 'stable'
        z=stabcdf(x,params(1),params(2),params(3),params(4));
    case 'Gaussian'
        z=normcdf(x,params(1),params(2));
end;

n=length(z);
z=min(sort(z(:)),1);
kp=max((1:n)'/n-z);
km=max(z-(0:n-1)'/n);
D=max(kp,km)*(sqrt(n)+0.12+0.11/sqrt(n));

A2=-1/n*(1:2:2*n-1)*(log(z)+log(1-z(n:-1:1)))-n;

ts=[A2,D];
warning('on','all')
```

automatically created on 2018-05-28
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
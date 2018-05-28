[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **ghypstat** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: ghypstat

Published in: Statistical Tools for Finance and Insurance

Description: 'Returns expected value and variance of generalized hyperbolic distribution. Required by STFstab04.m function.'

Keywords: variance, descriptive-statistics, hyperbolic, distribution, continuous

See also: STFstab04

Author: Rafal Weron

Submitted: Tue, September 18 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function [ex,varx] = ghypstat(lambda,alpha,beta,delta,mu)
%GHYPSTAT Returns expected value and variance of generalized hyperbolic 
%   distribution
%   SYNTAX: [ex,varx] = ghypstat(lambda, alpha, beta, delta, mu)

% Written by Rafal Weron, 20100730

psi = alpha^2 - beta^2;
% chi = delta^2
zeta = delta * sqrt(psi);

% ex = mu + (beta*delta/sqrt(psi))*(mbessel3(lambda+1,zeta)/mbessel3(lambda,zeta));
% varx = mbessel3(lambda+1,zeta)/(zeta*mbessel3(lambda,zeta)); 
% varx = varx + (beta*beta/psi)*( mbessel3(lambda+2,zeta)/mbessel3(lambda,zeta) - (mbessel3(lambda+1,zeta)/(zeta*mbessel3(lambda,zeta)))^2);
% varx = delta^2 * varx;

ex = mu + (beta*delta/sqrt(psi))*(besselk(lambda+1,zeta)/besselk(lambda,zeta));
varx = besselk(lambda+1,zeta)/(zeta*besselk(lambda,zeta));
varx = varx + (beta*beta/psi)*( besselk(lambda+2,zeta)/besselk(lambda,zeta) - (besselk(lambda+1,zeta)/(zeta*besselk(lambda,zeta)))^2);
varx = delta^2 * varx;
```

automatically created on 2018-05-28
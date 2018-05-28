[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **hyppdf** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: hyppdf

Published in: Statistical Tools for Finance and Insurance

Description: 'Contains the hyperbolic probability distribution function (pdf). Function is required by STFstab04.m.'

Keywords: pdf, probability, density, continuous, hyperbolic

Author: Rafal Weron

See also: STFstab04

Submitted: Tue, September 18 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function y=hyppdf(x,a,b,d,m)
if a^2-b^2>0 & a>0
    g=sqrt(a^2-b^2);
    y=g/(2*a*d*besselk(1,d*g))*exp(-a*sqrt(d^2+(x-m).^2)+b*(x-m));
else
    y=NaN(size(x));
end;
```

automatically created on 2018-05-28
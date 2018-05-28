[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **nigest** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: nigest

Published in: Statistical Tools for Finance and Insurance

Description: 'Estimates parameters from a Normal Inverse Gaussian distribution (NIG) by maximum likelihood method. This function is required by STFstab05.m and STFstab06.m.'

See also: STFstab05, STFstab06, nigmml

Keywords: normal, inverse, gaussian, distribution, density, estimation, parameter

Author: Rafal Weron

Submitted: Tue, September 18 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function [ay,by,dy,my]=nigest(x)
m=mean(x);
b=1;
a=2;
d=var(x);
y=fminsearch('nigmml',[a,b,d,m],[],x);
ay=y(1);
by=y(2);
dy=y(3);
my=y(4);
```

automatically created on 2018-05-28
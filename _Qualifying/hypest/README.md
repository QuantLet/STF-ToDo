[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **hypest** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: hypest

Published in: Statistical Tools for Finance and Insurance

Description: 'Estimates hyperbolic distribution. Auxiliary Function, Required by STFstab05.m and STFstab06.m function.'

See also: STFstab05, STFstab06, hypmml

Keywords: pdf, probability, density, continuous, hyperbolic

Author: Rafal Weron

Submitted: Tue, September 18 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function [ay,by,dy,my]=hypest(x)
m=mean(x);
b=1;
a=2;
d=var(x);
y=fminsearch('hypmml',[a,b,d,m],[],x);
ay=y(1);
by=y(2);
dy=y(3);
my=y(4);
```

automatically created on 2018-05-28
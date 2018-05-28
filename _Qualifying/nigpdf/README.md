[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **nigpdf** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: nigpdf

Published in: Statistical Tools for Finance and Insurance

Description: 'Calculates the probability density function (PDF) of an Normal Inverse Gaussian (NIG) distribution. Required by STFstab04.m function.'

See also: STFstab04

Keywords: normal, inverse, gaussian, pdf, density, estimation

Author: Rafal Weron

Submitted: Tue, September 18 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function y=nigpdf(x,a,b,d,m)
if a^2-b^2>0 & a>0 & a<100
    g=sqrt(a^2-b^2);
    y=a*d*besselk(1,a*sqrt(d^2+(x-m).^2))./(pi*sqrt(d^2+(x-m).^2)).*exp(d*g+b*(x-m));
else
    y=NaN(size(x));
end;
```

automatically created on 2018-05-28
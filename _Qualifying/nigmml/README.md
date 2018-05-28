[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **nigmml** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: nigmml 

Published in: Statistical Tools for Finance and Insurance

Description: 'Gives the maximum likelihood function for the Normal Inverse Gaussian (NIG) distribution to plugin into the command fminsearch.'

See also: STFstab05, nigest

Author: Rafal Weron

Keywords: normal, inverse, gaussian, distribution, density, maximum-likelihood, MLE, parameter

Submitted: Mon, November 05 2012 by Awdesch Melzer

Example: fminsearch('nigmml',[a,b,d,m],[],x)


```

### MATLAB Code
```matlab

function y=nigmml(v,x)
a=v(1);
b=v(2);
d=v(3);
m=v(4);
n=length(x);
pom=a^2-b^2;
if d>0 & pom>0 & a>0 & a<100
    g=sqrt(pom);
    if all(besselk(1,a*sqrt(d^2+(x-m).^2)))>0
        y=-n*(log(a*d/pi))-sum(log(besselk(1,a*sqrt(d^2+(x-m).^2))))+sum(log(sqrt(d^2+(x-m).^2)))-n*d*g-b*sum(x-m);
    else
        y=realmax;
    end
else
    y=realmax;
end;
```

automatically created on 2018-05-28
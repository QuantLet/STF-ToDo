[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **hypmml** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: hypmml

Published in: Statistical Tools for Finance and Insurance

Description: 'Gives the maximum likelihood function for the hyperbolic distribution to plug in the command fminsearch.'

Keywords: hyperbolic, likelihood, distribution, estimation, optimization

See also: STFstab05, hypest

Author: Rafal Weron

Submitted: Mon, November 05 2012 by Awdesch Melzer

Example: 'fminsearch("hypmml",[a,b,d,m],[],x)'
```

### MATLAB Code
```matlab

function y=hypmml(v,x)
a=v(1);
b=v(2);
d=v(3);
m=v(4);
n=length(x);
pom=a^2-b^2;
if d>0 & pom>0 & a>0
    g=sqrt(pom);
    if besselk(1,d*g)>0
        y=-n*(log(g/(2*a*d*besselk(1,d*g))))+a*sum(sqrt(d^2+(x-m).^2))-b*sum(x-m);
    else
        y=realmax;
    end
else
    y=realmax;
end;
```

automatically created on 2018-05-28
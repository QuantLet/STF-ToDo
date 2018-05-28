[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **tstabpdf3** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: tstabpdf3

Published in: Statistical Tools for Finance and Insurance

Description: 'Calculates distribution of a stable distribution. Auxiliary function, required by STFstab03.m and STFstab04.m function.'

Author: Rafal Weron

Keywords: pdf, stable, distribution, stable distribution, density

See also: STFstab03, STFstab04

Submitted: Tue, September 18 2012 by Dedy Dwi Prastyo


```

### MATLAB Code
```matlab

function y=tstabpdf3(x,alpha,sigma,lambda,beta);
x=x(:);%dopisa³em 13-06
if nargin<5
    beta=0;
end;
N=length(x);
if (alpha>0)&&(alpha<=2)&&(alpha~=1)&&(lambda>0)&&(sigma>0)&&(beta<=1)&&(beta>=-1)
    xmax=max(abs(x))+1;
    [xp,yp]=tstabpdf(alpha,sigma,lambda,beta,xmax);
    
%a to przenios³em dla innej interpolacji, ale niepotrzebnie
%     y=zeros(N,1);
%     for i=1:N
%         ind=sum(x(i)>xp);
%         y(i)=yp(ind)+(yp(ind+1)-yp(ind))/(xp(ind+1)-xp(ind))*(x(i)-xp(ind));
%     end;
    
    y=max(interp1q(xp',yp',x),eps);
else
    y=NaN(N,1);
end;
```

automatically created on 2018-05-28
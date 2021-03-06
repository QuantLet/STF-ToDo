[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **cvln** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: cvln

Published in: Statistical Tools for Finance and Insurance

Description: 'Simulates values of the EDF statistics for the lognormal distribution for given values of MU and SIGMA. Required by STFloss08t.'

Keywords: simulation, edf, lognormal, distribution, univariate

Author: Joanna Janczura

See also: STFloss08t

Submitted: Tue, October 09 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function [D,V,W2,A2]=cvln(n,m,mu,sigma,method,numberofiterations) 
% CVLN  Simulated values of the EDF statistics for the lognormal distribution.
%    [D,V,W2,A2]=CVLN(N,M,MU,SIGMA,METHOD,NUMBERIFITERATIONS) returns 
%    simulated values of the EDF statistics for the lognormal distribution 
%    with a given parameters MU, SIGMA. It uses M simulated samples 
%    of length N and the chosen method of estimation (METHOD=0 - method
%    of moments, METHOD=1 - maximum likelihood, METHOD=2 - A2 statistic 
%    minimalization). NUMBEROFITERATIONS is the number of iterations
%    in estimation, if needed.


u=zeros(n,m);
emp=zeros(n,m);
x=lognrnd(mu,sigma,n,m);
for i=1:m
   [db,delik,demin,vb,velik,vemin,w2b,w2elik,w2emin,a2b,a2elik,a2emin,mu,sigma,mulik,sigmalik,mumin,sigmamin,caution]=estln(x(:,i),method,numberofiterations);
   if(method==1)
      mur=mulik;
      sigmar=sigmalik;
   else if(method==2)
      mur=mumin;
      sigmar=sigmamin;
      else
          mur=mu;
          sigmar=sigma;
      end
   end
   u(:,i)=sort(logncdf(x(:,i),mur,sigmar));
   emp(:,i)=(1:n)/n;    
end
Dplus=max(emp-u);
Dminus=max(u-emp+1/n);
D=max([Dplus;Dminus]);

V=(Dplus+Dminus);

for i=1:m
    W2(i)=sum((u(:,i)-((1:2:(2*n-1))/(2*n))').^2)+1/(12*n);
end
for i=1:m
    A2(i)=-n-1/n*sum((1:2:(2*n-1))'.*log(u(:,i))+((2*n-1):-2:1)'.*log(1-u(:,i)));
end


```

automatically created on 2018-05-28
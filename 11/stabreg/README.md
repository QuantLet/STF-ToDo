[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **stabreg** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: stabreg

Published in: Statistical Tools for Finance and Insurance

Description: 'Contains regression parameter estimates of a stable distribution. Required by STFstab05.m and STFstab06.m function.'

Keywords: estimation, regression, stable, stable distribution, distribution

See also: STFstab05, STFstab06, stab_reg_kw

Author: Rafal Weron

Submitted: Sat, March 15 2014 by Lukas Borke
```

### MATLAB Code
```matlab

function [alpha,sigma,beta,mu]=stabreg(x,epsilon,maxit,deltac)
%STABREG Regression parameter estimates of a stable distribution.
%   [ALPHA,SIGMA,BETA,MU]=STABREG(X) returns the estimated (regression 
%   method of Koutrouvelis) parameters ALPHA, SIGMA, BETA and MU of a 
%   stable distribution vector X.
%   [ALPHA,SIGMA,BETA,MU]=STABREG(X,EPSILON,MAXIT,DELTAC) additionally 
%   allows to specify the maximum error EPSILON (default value: 1e-5), 
%   maximum number of iterations MAXIT (default: 5) and a vector of 
%   parameters DELTAC (default: 0:99) used in the regression for BETA and 
%   MU.
%
%   Reference(s):
%   [1] I.A.Koutrouvelis (1980) "Regression-Type Estimation of the
%   Parameters of Stable Laws", JASA 75, 918-928.
%	[2] R.Weron (2004) "Computationally intensive Value at Risk 
%   calculations", in "Handbook of Computational Statistics: Concepts and 
%   Methods", eds. J.E. Gentle, W. Haerdle, Y. Mori, Springer, Berlin, 
%   911-950. 

%   Written by Szymon Borak and Rafal Weron (2000.12.15, rev. 2002.12.04)
%   Copyright (c) 2000-2006 by Rafal Weron

% Initialize input parameters with default values
if nargin<4, delc=0:99; else delc=deltac; end;
if nargin<3, maxit=5; end;
if nargin<2, epsilon=0.00001; end;

% Define optimal parameter vectors (see [1])
Kopt   = [9   11  16  18  22  24  68  124];
Lopt   = [10  14  16  18  14  16  38  68];
indexA = [1.9 1.5 1.3 1.1 0.9 0.7 0.5 0.3];

[xrow,xcol]=size(x);
if xrow==1,
  x=x';
  xrow=xcol;
  xcol=1;
end;

% Compute initial parameter estimates using McCulloch's method
[alpha,sigma,beta,mu]=stabcull(x);

% Run regression
x=(x-ones(xrow,1)*mu)./(ones(xrow,1)*sigma);
for n=1:xcol,
  X=x(:,n);
  K=11;
  t=[1:K]*pi/25;
  w=log(abs(t));
  w1=w-mean(w);
  y=[];
  for tt=t,
    y=[y mean(exp(i*tt*X))];
  end;
  y=log(-2*log(abs(y)));
  
  alpha1=(sum(w1.*(y-mean(y))))/sum(w1.*w1);
  if alpha1<=0.9,
    K=30;
    t=[1:K]*pi/25;
    w=log(abs(t));
    w1=w-mean(w);
    y=[];
    for tt=t,
      y=[y mean(exp(i*tt*X))];
    end;
    y=log(-2*log(abs(y)));
    alpha1=(sum(w1.*(y-mean(y))))/sum(w1.*w1);
  end;
  
  it=1;
  c1=0;
  beta2 = beta(n);
  delta2 = 0;
  while (it<=maxit) & ((abs(c1-1))>epsilon),
    K=Kopt(min([(find(indexA<=alpha1)) 8]));
    t=[1:K]*pi/25;
    w=log(abs(t));
    w1=w-mean(w);
    y=[];
    for tt=t,
      y=[y mean(exp(i*tt*X))];
    end;
    y=log(-2*log(abs(y)));
   
    
    alpha1=(sum(w1.*(y-mean(y))))/sum(w1.*w1);
    c1=(0.5*exp(mean(y-alpha1*w)))^(1/alpha1);
    L=Lopt(min([(find(indexA<=alpha1)) 8]));
    u=[1:L]*pi/50;
        
    X=X/c1;
    
    sinXu=[];
    cosXu=[];
    for uu=u,
      uuX=uu*X;
      sinXu=[sinXu sum(sin(uuX))];
      cosXu=[cosXu sum(cos(uuX))];
    end;
  
    testcos=((1+0*(delc'))*cosXu).*cos(delc'*u)+((1+0*(delc'))*sinXu).*sin(delc'*u);
    testcos=sum(abs(diff(sign(testcos'))));
    deltac=delc(min(find(testcos==0)));
    if length(deltac)==0, 
        warning('! impossible to find DELTAc'); 
        it = maxit + 1;
    else
        X=X-deltac;
        z=atan((sinXu*cos(deltac)-cosXu*sin(deltac))./(cosXu*cos(deltac)+sinXu*sin(deltac)));
        y=(c1^alpha1)*tan(pi*alpha1/2)*sign(u).*(u.^alpha1);
        delta2=(sum(y.*y)*sum(u.*z)-sum(u.*y)*sum(z.*y))/(sum(u.*u)*sum(y.*y)-(sum(u.*y))^2);
        beta2=(sum(u.*u)*sum(y.*z)-sum(u.*y)*sum(u.*z))/(sum(u.*u)*sum(y.*y)-(sum(u.*y))^2);
        sigma(n)=sigma(n)*c1;
        mu(n)=mu(n)+deltac*sigma(n);
        it=it+1;
    end;
  end;
  alpha(n)=alpha1;
  beta(n)=beta2;
  mu(n)=mu(n)+sigma(n)*delta2;
end;

% Correct estimates for out of range values
alpha(alpha<=0)=10^(-10)+0*alpha(alpha<=0);
alpha(alpha>2)=2+0*alpha(alpha>2);
sigma(sigma<=0)=10^(-10)+0*sigma(sigma<=0);
beta(beta<-1)=-1+0*beta(beta<-1);
beta(beta>1)=1+0*beta(beta>1);

```

automatically created on 2018-05-28
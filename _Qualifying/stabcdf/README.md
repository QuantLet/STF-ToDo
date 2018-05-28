[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **stabcdf** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: stabcdf

Published in: Statistical Tools for Finance and Insurance

Description: '(Alpha-)stable cumulative distribution function (cdf). Required by STFstab05.m and STFstab06.m function.'

Keywords: distribution, cdf, stable, stable distribution, parameter

See also: STFstab05, STFstab06

Author: Rafal Weron, Szymon Borak

Submitted: Tue, September 18 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function y=stabcdf(x,alpha,sigma,beta,mu,n)
%STABCDF (Alpha-)stable cumulative distribution function (cdf).
%   Y=STABCDF(X,ALPHA,SIGMA) returns the cdf of a symmetric (alpha-)stable 
%   distribution with index ALPHA and scale parameter SIGMA, evaluated at 
%   the values in vector X.
%   Y=STABCDF(X,ALPHA,SIGMA,BETA,MU,N) additionally allows to specify the 
%   skewness parameter BETA, the location paramter MU and the numer N of
%   intervals for which the intgral is computed.
%   STABCDF uses Nolan's [1] integral formulas.
%
%   Reference(s):
%   [1] J.P.Nolan (1997) "Numerical Calculation of Stable Densities and 
%   Distribution Functions", Communications in Statistics - Stochastic 
%   Models 13, 759-774.
%	[2] R.Weron (2004) "Computationally intensive Value at Risk 
%   calculations", in "Handbook of Computational Statistics: Concepts and 
%   Methods", eds. J.E. Gentle, W. Haerdle, Y. Mori, Springer, Berlin, 
%   911-950. 

%   Written by Szymon Borak and Rafal Weron (2002.12.04)
%   Copyright (c) 2002-2006 by Rafal Weron

% Initialize with default values
if nargin < 6,
   n = 2000;
end
if nargin < 5, 
    mu = 0;
end
if nargin < 4;
    beta = 0;
end

% Integrate using Nolan's [1] formulas
x = x(:);
y = x*0;
if (alpha == 1) 
    % Compute integral for alpha==1
    x = (x-mu)/sigma - beta*2/pi* log(sigma);
    sg = 0 ;
    if (beta == 0 )
      y = 0.5 + 1/pi * atan(x);
    else
        if (beta<0)
        beta = -beta;
        x = -x;
        sg = 1;
        end
    teta0 = 0.5*pi;
    teta = (1:n-1)'*(0.5*pi+teta0)/n - teta0 ;
    T = teta.*ones(length(teta),length(x));
    V = 2/pi* (0.5*pi + beta* T)./cos(T);
    V = V.*exp(((0.5*pi+beta*T)./beta).*tan(T)) ;
    G = x'*ones(1,length(x));
    G = exp(-0.5*pi.*G./beta).*V;
    G = exp(-1*G);
    dt = teta(2)-teta(1);
    I = sum(G)*dt; 
    F = 1/pi.*I';
    y = F + sg*(1-2*F);
    end
else
    % Compute integral for alpha~=1
    x = (x - mu)/sigma-beta*tan(0.5*pi*alpha);
    zeta = -beta*tan(0.5*pi*alpha);
    teta0 = (1/alpha)*atan(beta*tan(0.5*pi*alpha));
    xt = x - zeta;
    k1 = find(xt>0); 
    
    if (-teta0 < 0.5*pi & isempty(k1) == 0 )
      teta = (1:n-1)'*(0.5*pi+teta0)/n - teta0  ;
      
      T = teta*ones(1,length(xt(k1)));
      V = cos(alpha*teta0 + (alpha-1)*T)./cos(T);
      V = V.*(cos(T)./sin( alpha*(teta0+T) ) ).^(alpha/(alpha-1));
      V = V.*((cos(alpha*teta0)).^(1/(alpha-1)));
      G = ones(length(teta),1)*xt(k1)';
      G = G.^(alpha/(alpha-1));
      G = G.*V;
      G = exp(-1*G);
      dt = teta(2)-teta(1);
      I = sum(G)*dt  ; %integrating
      c1 = (alpha > 1) + 1/pi * (0.5*pi - teta0)*( alpha < 1);
      y(k1) =sign(1-alpha)/pi.*I' + c1 ;
    end
   
    k0 = find(xt==0);
    y(k0) = 1/pi * (0.5*pi - teta0);
    
    k2 = find(xt<0);
    teta0 = - teta0;
    xt(k2) = -xt(k2);
    if (-teta0 < 0.5*pi & isempty(k2) == 0 )
      teta = (1:n-1)'*(0.5*pi+teta0)/n - teta0;  
      T = teta*ones(1,length(xt(k2)));
      V = cos(alpha*teta0 + (alpha-1)*T)./cos(T);
      V = V.*(cos(T)./sin( alpha*(teta0+T) ) ).^(alpha/(alpha-1));
      V = V.*((cos(alpha*teta0)).^(1/(alpha-1)));
      G = ones(length(teta),1)*xt(k2)';
      G = G.^(alpha/(alpha-1));
      G = G.*V;
      G = exp(-1*G);
      dt = teta(2)-teta(1);
      I = sum(G)*dt  ;% integrating
      c1 = (alpha > 1) + 1/pi * (0.5*pi - teta0)*( alpha < 1);
      y(k2) =1 - sign(1-alpha)/pi.*I' - c1 ;
    end
end
  

```

automatically created on 2018-05-28
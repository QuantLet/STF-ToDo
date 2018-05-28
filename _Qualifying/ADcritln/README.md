[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **ADcritln** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: ADcritln 

Published in: Statistical Tools for Finance and Insurance

Description: 'Calculates the Anderson-Darling test statistic for a lognormal distribution. Required by STFloss08t.'

Keywords: distribution, test, lognormal, univariate, Testing

Author: Joanna Janczura

See also: ADcritBurr, STFloss08t

Submitted: Tue, October 09 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function A2 = ADcritln(param,x) 
% ADCRITLN   Anderson-Darling test statistics for the lognormal distribution.
%            A2=ADcritln(param,x) returns the value of the Anderson-Darling
%            statistics for the lognormal distribution with given parameters (param) 
%            and data from the analyzed sample (x).

    global d v w2 a2;
    n      = length(x);
    mu     = param(1);
    sigma  = param(2);
    u      = sort(logncdf(x,mu,sigma))';

    emp    = (1:n)/n;
    Dplus  = max(emp-u);
    Dminus = max(u-emp+1/n);
    D      = max([Dplus;Dminus]);

    V      = Dplus+Dminus;
  
    W2     = sum((u-(1:2:(2*n-1))/(2*n)).^2)+1/(12*n);

    uno0   = u(find(u~=0));
    if (~isempty(uno0) && length(uno0)~=n)
        u(find(u==0))=min(uno0);
    end
    uno1 = u(find(u~=1));
    if (~isempty(uno1)&& length(uno1)~=n)
        u(find(u==1))=max(uno1);
    end
    A2 = -n-1/n*sum((1:2:(2*n-1)).*log(u)+((2*n-1):-2:1).*log(1-u));

    d  = [d;D];
    v  = [v;V];
    w2 = [w2;W2];
    a2 = [a2;A2];


```

automatically created on 2018-05-28
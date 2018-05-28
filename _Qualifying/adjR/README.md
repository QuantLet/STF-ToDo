[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **adjR** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: adjR

Published in: Statistical Tools for Finance and Insurance

Description: 'Returns the adjustment coefficient R for a mixture of two exponential parameters. Needed by STFruin05.m.'

Keywords: parameter, Poisson process, exponential, risk, distribution

Author: Zografia Anastasiadou

See also: STFruin05, STFruin05

Submitted: Fri, May 04 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

% returns the adjustment coefficient R for mixture of 2 exponentials distribution claims

function [ R ] = adjR( theta, dparameters,m,m2,m3 )

    % theta: security loading in insurance collective risk model
	% dparameters: list, composed of 2 vectors containing the parameters of the loss distribution, weights (first vector) and exponential parameters (second vector)
	p1=dparameters(:,1); % weights
    p2=dparameters(:,2); % exponential parameters
	R0=min(p2);
    R0=[12*theta*m/(3*m2+sqrt(9*m2^2+24*m*m3*theta)),R0];
    R0=min(R0);
    r=R0;
    err=1;
while (err>0.000000001)
    D1=1+(1+theta)*m*r-mgfs(r,0,dparameters);
    D2=(1+theta)*m-mgfs(r,1,dparameters);
    err=r;
    r=r-D1/D2;
    err=abs(err-r)/r;
    R=r;
end
	
end

```

automatically created on 2018-05-28
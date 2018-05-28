[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **mgfs** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: mgfs

Published in: Statistical Tools for Finance and Insurance

Description: 'Returns the moment generating function or its k-th derivative (up to third) for mixture of two exponential distributions claimsSTFruin05.m.'

Keywords:  exponential, derivative, distribution, cumulant generating function, cumulant

Author: Zografia Anastasiadou

See also: STFruin05, STFruin05

Submitted: Fri, May 04 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

% returns the moment generating function or its k-th derivative (up to third) for mixture of 2 exponentials distribution claims

function [ y ] = mgfs( x,k,dparameters )

	% x: scalar, n x 1 vector or m x n matrix,  argument of the moment generating function
	% k: scalar, integer, 0 =< k <= 3, order of the derivative
	% dparameters: vector, composed of 2 columns containing the parameters of the loss distribution, weights (first column) and exponential parameters (second column)
	
    p1=dparameters(:,1); % weights
    p2=dparameters(:,2); % exponential parameters
   if (k==0)
    y=sum((p1.*p2)./(p2-x'));
   elseif(k==1)
    y=sum((p1.*p2)./((p2-x').^2));
   elseif(k==2)
	y=2*sum((p1.*p2)./((p2-x').^3));
   elseif(k==3)
	y=6*sum((p1.*p2)./((p2-x').^4));
end


```

automatically created on 2018-05-28
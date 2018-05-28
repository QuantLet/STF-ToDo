[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **moments** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: moments

Published in: Statistical Tools for Finance and Insurance

Description: 'Returns the k-th moment (up to fourth) of the mixture of 2 exponentials distribution claims. Needed by STFruin05.m.'

Keywords: exponential, risk, distribution, cdf, pdf

See also: 'STFruin05, STFruin06, STFruin07, STFruin08, STFruin09, STFruin10, STFruin12, STFruin13, STFruin14'

Author: Zografia Anastasiadou

Submitted: Fri, May 04 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

% returns the k-th moment (up to fourth) of the mixture of 2 exponentials distribution claims

function [ mk ] = moments( k,dparameters );

    % k: order of moment to calculate
	% dparameters: list, composed of 2 vectors containing the parameters of loss distribution, weights (first vector) and exponential parameters (second vector)
    p1=dparameters(:,1); % weights
    p2=dparameters(:,2); % exponential parameters
   if (k==1)
    mk=sum(p1./p2);
   elseif (k==2)
    mk=2*sum(p1./(p2.^2));
   elseif (k==3)
	mk=6*sum(p1./(p2.^3));
   elseif (k==4)
    mk=24*sum(p1./(p2.^4));
   else
       disp('k chosen too large')
end


```

automatically created on 2018-05-28
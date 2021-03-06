[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **estBurr** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: estBurr

Published in: Statistical Tools for Finance and Insurance

Description: 'Estimates the parameters of Burr distribution. Parameter estimation can be done by maximum likelihood (ML) or optimization based on Anderson-Darling statistic (A2). Required by STFloss08t.'

Keywords: parameter, estimation, heavy-tailed, maximum-likelihood, loss function

Author: Joanna Janczura

See also: STFloss08t

Submitted: Tue, October 09 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function [db,de,vb,ve,w2b,w2e,a2b,a2e,alpha,lambda,tau,alphamin,lambdamin,taumin,likconv]=estBurr(analyzedsample,method,numberofiterations)
% ESTBURR Estimation of the Burr distribution parameters.
%       estBurr(analyzedsample,method,numberofiterations) returns the
%       estimated parmeters of the Burr distribution calculated from 
%       the data in ANALYZEDSAMPLE using method specified by the parameter
%       METHOD (0 - all methods, 1 - ML, 2 - A2). NUMBEROFITERATIONS is 
%       the number of iterations in the estimation procedure.

  global d v w2 a2;

  db=NaN;
  de=NaN;
  vb=NaN;
  ve=NaN;
  w2b=NaN;
  w2e=NaN;
  a2b=NaN;
  a2e=NaN;
  alpha=NaN;
  lambda=NaN;
  tau=NaN;
  alphamin=NaN;
  lambdamin=NaN;
  taumin=NaN;
  likconv=NaN;


%starting parameters
  alphas=1;
  lambdas=mean(analyzedsample);
  taus=1;
  if((method==1)||(method==0))
    [nmin,fval,likconv]=fminsearch(@loglikBurr,[alphas,lambdas,taus], optimset('MaxIter',numberofiterations,'Display','off'),analyzedsample);
    alpha=nmin(1);
    lambda=nmin(2);
    tau=nmin(3);
    
    d=0;
    v=0;
    w2=0;
    a2=0;
    ADcritBurr([alpha,lambda,tau],analyzedsample);
    db=d(2);
    vb=v(2);
    w2b=w2(2);
    a2b=a2(2);
 end

  if((method==2)||(method==0))
    
    d=0;
    v=0;
    w2=0;
    a2=0;
    
    nmin=fminsearch(@ADcritBurr,[alphas,lambdas,taus],optimset('MaxIter',numberofiterations,'MaxFunEval',numberofiterations,'Display','off'),analyzedsample);
    alphamin=nmin(1);
    lambdamin=nmin(2);
    taumin=nmin(3);

    de=d(length(d));
    ve=v(length(v));
    w2e=w2(length(w2));
    a2e=a2(length(a2));
  end



```

automatically created on 2018-05-28
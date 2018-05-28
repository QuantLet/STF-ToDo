[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **estln** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: estln

Published in: Statistical Tools for Finance and Insurance

Description: 'Estimates the parameters of a log-normal distribution. Possible methods for estimation are: maximum likelihood, method of moments Required by STFloss08t.'

Keywords: estimation, distribution, lognormal, parameter, univariate

Author: Joanna Janczura

See also: STFloss08t

Submitted: Tue, October 09 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function [db,delik,demin,vb,velik,vemin,w2b,w2elik,w2emin,a2b,a2elik,a2emin,mu,sigma,mulik,sigmalik,mumin,sigmamin,caution]=estln(analyzedsample,method,numberofiterations)
% ESTLN Estimation of the lognormal distribution parameters.
%       estln(analyzedsample,method,numberofiterations) returns the
%       estimated parmeters of the lognormal distribution calculated from 
%       the data in ANALYZEDSAMPLE using method specified by the parameter
%       METHOD (0 - all methods, 1 - method of moments(MoM) and ML, 
%       2 - MoM and A2). NUMBEROFITERATIONS is the number of iterations 
%       in the estimation procedure.

  global     d v w2 a2;

  db=NaN;
  delik=NaN;
  demin=NaN;
  vb=NaN;
  velik=NaN;
  vemin=NaN;
  w2b=NaN;
  w2elik=NaN;
  w2emin=NaN;
  a2b=NaN;
  a2elik=NaN;
  a2emin=NaN;
  mulik=NaN;
  sigmalik=NaN;
  mumin=NaN;
  sigmamin=NaN;
  caution=0;
 
%method of moments
  lm1=log(mean(analyzedsample));
  lm2=log(mean(analyzedsample.^2));  
  if(lm2>2*lm1)
    mu=2*lm1-lm2/2;
    sigma=sqrt(lm2-2*lm1);
  else
    mu=mean(log(analyzedsample));
    sigma=sqrt(mean((log(analyzedsample)-mu).^2));
    caution=1;
  end
  if((method==1)||(method==0))
    mulik=mean(log(analyzedsample));
    sigmalik=sqrt(mean((log(analyzedsample)-mulik).^2));
    d=0;
    v=0;
    w2=0;
    a2=0;

    ADcritln([mulik,sigmalik],analyzedsample);

    delik=d(2);
    velik=v(2);
    w2elik=w2(2);
    a2elik=a2(2);
  end
  
  if((method==2)||(method==0))
    d=0;
    v=0;
    w2=0;
    a2=0;
    [nmin,fval,likconv]=fminsearch(@ADcritln,[mu,sigma], optimset('MaxIter',numberofiterations,'Display','off'),analyzedsample);
    mumin=nmin(1);
    sigmamin=nmin(2);
    db=d(2);
    demin=d(length(d));
    vb=v(2);
    vemin=v(length(v));
    w2b=w2(2);
    w2emin=w2(length(w2));
    a2b=a2(2);
    a2emin=a2(length(a2));
  end

```

automatically created on 2018-05-28
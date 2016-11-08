function [db,delik,demin,vb,velik,vemin,w2b,w2elik,w2emin,a2b,a2elik,a2emin,alpha,lambda,alphalik,lambdalik,alphamin,lambdamin,caution]=estPareto(analyzedsample,method,numberofiterations)
% ESTPARETO Estimation of the Pareto distribution parameters.
%       estPareto(analyzedsample,method,numberofiterations) returns the
%       estimated parmeters of the Pareto distribution calculated from 
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
  alphalik=NaN;
  lambdalik=NaN;
  alphamin=NaN;
  lambdamin=NaN;
  caution=0;
  
%method of moments
  m1=mean(analyzedsample);
  m2=mean(analyzedsample.^2);
  if(m2>2*m1^2)
    alpha=2*(m2-m1^2)/(m2-2*m1^2);
    lambda=m1*m2/(m2-2*m1^2);
  else
    alpha=1;
    lambda=m1;
    caution=1;
  end

  if((method==1)||(method==0))
    [nmin,fval,likconv]=fminsearch(@loglikPareto,[alpha,lambda], optimset('MaxIter',numberofiterations,'Display','off'),analyzedsample);
    alphalik=nmin(1);
    lambdalik=nmin(2);

    d=0;
    v=0;
    w2=0;
    a2=0;
    ADcritPareto([alphalik,lambdalik],analyzedsample);
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
    [nmin,fval,likconv]=fminsearch(@ADcritPareto,[alpha,lambda], optimset('MaxIter',numberofiterations,'Display','off'),analyzedsample);
    alphamin=nmin(1);
    lambdamin=nmin(2);
    
    db=d(2);
    demin=d(length(d));
    vb=v(2);
    vemin=v(length(v));
    w2b=w2(2);
    w2emin=w2(length(w2));
    a2b=a2(2);
    a2emin=a2(length(a2));
  end
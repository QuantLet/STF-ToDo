function y=mixexprnd(p,beta1,beta2,n,m)
%MIXEXPRND Random arrays from the mixed exponential distribution.
%   Y = MIXEXPRND(P,BETA1,BETA2,N,M) returns an M-by-N array of random numbers 
%   chosen from the mixed exponential distribution with parameters P, BETA1, BETA2.
%
%   The default values for A, BETA1, BETA2, N, M are 0.5, 1, 2, 1, 1,
%   respectively.
%
%   MIXEXPRND uses the exponential number generator.

  if nargin<1
      p=.5;
  end
  if nargin<2
    beta1=1;
  end
  if nargin<3
    beta2=2;
  end
  y=exprnd(1/beta2,n*m,1);
  aux=find(rand(n*m,1)<=p);
  if(~isempty(aux))
    y(aux)=exprnd(1/beta1,size(aux));
 end
  y=reshape(y,n,m);

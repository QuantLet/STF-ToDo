function y=Paretocdf(x,alpha,lambda,control)
%PARETOCDF Pareto cumulative distribution function.
%   Y = PARETOCDF(X,ALPHA,LAMBDA, CONTROL) returns the cdf of the Pareto
%   distribution with parameters ALPHA, LAMBDA, evaluated at the values in X.
%   For CONTROL=0 the error message is displayed, if the parmeters are
%   negative.
%   
%   The default values for ALPHA, LAMBDA and CONTROL are 1, 1, 0, respectively.

  if nargin<4
    control=0;
  end
  if nargin<3
    lambda=1;
  end
  if nargin<2
    alpha=1;
  end
  if(control==0)
      if lambda<=0
        error('Non-positive lambda!');
      end
      if alpha<=0
        error('Non-positive alpha!');
      end
  end

  y=zeros(size(x));
  positive=find(x>0);
  y(positive)=1-(lambda./(lambda+x(positive))).^alpha;

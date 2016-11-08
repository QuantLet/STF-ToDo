function y=Burrcdf(x,alpha,lambda,tau,control)
%BURRCDF Burr cumulative distribution function.
%   Y = BURRCDF(X,ALPHA,LAMBDA,TAU, CONTROL) returns the cdf of the Burr 
%   distribution with parameters ALPHA,LAMBDA,TAU, evaluated at the values in X.
%   For CONTROL=0 the error message is displayed, if the parmeters are
%   negative.
%   
%   The default values for the parameters ALPHA, LAMBDA, TAU, CONTROL are
%   1, 1, 2, 0, respectively.

  if nargin<5
    control=0;
  end
  if nargin<4
     tau=2;
  end 
  if nargin<3
    lambda=1;
  end
  if nargin<2
    alpha=1;
  end
  if(control==0)
        if(alpha<=0)
            error('Non-positive tau!');
        end
        if(lambda<=0)
            error('Non-positive lambda!');
        end
        if(tau<=0)
            error('Non-positive alpha!');
        end
  end

 
  y=zeros(size(x));
  pos=find(x>0);
  y(pos)=1-(lambda./(lambda+(x(pos)).^tau)).^alpha;


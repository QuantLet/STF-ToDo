% ---------------------------------------------------------------------
% Book:        STF
% ---------------------------------------------------------------------
% See also:    simNHPP, simHPPALP
% ---------------------------------------------------------------------
% Quantlet:    simNHPPALP
% ---------------------------------------------------------------------
% Description: simNHPPALP generates aggregate loss process driven by
%              the non-homogeneous Poisson process.
% ---------------------------------------------------------------------
% Usage:       y = simNHPPALP(lambda,parlambda,distrib,params,T,N)
% ---------------------------------------------------------------------
% Input:       
% Parameter:   lambda
% Definition:  scalar, intensity function, sine function (lambda=0)
%              linear function (lambda=1) or sine square function (lambda=2)
% Parameter:   parlambda
% Definition:  n x 1 vector, parameters of the intensity function lambda
%              (n=2 for lambda=1, n=3 otherwise)
% Parameter:   distrib
% Definition:  string, claim size distribution:
%              'Burr' - Burr distribution
%              'exponential' - exponential distribution
%              'gamma' - gamma distribution
%              'lognormal' - lognormal distribution
%              'mixofexps' - mix of exponential distributions
%              'Pareto' - Pareto distribution
%              'Weibull' - Weibull distribution
% Parameter:   params
% Definition:  n x 1 vector, parameters of the claim size distribution
%              n = 1 (exponential)
%              n = 2 (gamma, lognormal, Pareto, Weibull)
%              n = 3 (Burr, mixofexps)
% Parameter:   T
% Definition:  scalar, time horizon
% Parameter:   N
% Definition:  scalar, number of trajectories
% ---------------------------------------------------------------------
% Output:      
% Parameter:   y
% Definition:  2*max+2 x N x 2 array, generated process - max is the 
%              maximum number of jumps for all generated trajectories 
% ---------------------------------------------------------------------
% Example:     
%             y1 = simNHPPALP(0,[1,1,0],'Burr',[3,2,1],5,1);
%             y2 = simNHPPALP(1,[1,1],'Pareto',[1.5,2.5],5,1);
%             plot(y1(:,:,1),y1(:,:,2),'r-')
%             ylim([min(min(y1(:,:,2)),min(y2(:,:,2))),max(max(y1(:,:,2)),max(y2(:,:,2)))])
%             line(y2(:,:,1),y2(:,:,2))
% ---------------------------------------------------------------------
% Result:      Show two trajectories of aggregate loss process driven
%              by the non-homogeneous Poisson process.
% ---------------------------------------------------------------------
% Keywords:    Poisson process, risk process
% ---------------------------------------------------------------------
% Reference:   K. Burnecki, R.Weron (2004) 'Modeling of the risk process',
%	           in 'Statistical Tools for Finance and Insurance', 
%              eds. P. Cizek, W. Härdle, R. Weron, Springer.
% ---------------------------------------------------------------------
% Author:      Awdesch Melzer 20130727
% ---------------------------------------------------------------------

function [y] = simNHPPALP(lambda,parlambda,distrib,params,T,N)
  
  if(lambda ~= 0 && lambda ~= 1 && lambda~=2)
  	error('simNHPPALP: Lambda must be either 0,1 or 2.');
  end
  if(T <= 0 || (length(T))~=1)
  	error('simNHPPALP: T must be a positive scalar.');
  end
  if(N <= 0 || (length(N))~=1)
  	error('simNHPPALP: N must be a positive scalar.');
  end
  if(length(parlambda)~=3 && (lambda)~=1)
  	error('simNHPPALP: for lambda 0 or 2, parlambda must be a 3 x 1 vector.');
  end
  if(length(parlambda)~=2 && (lambda)==1)
  	error('simNHPPALP: for lambda 1, parlambda must be a 2 x 1 vector.');
  end
  if((strcmp(distrib,'Burr') || strcmp(distrib,'mixofexps')) && (length(params)~=3))
   	error('simNHPPALP: for Burr and mixofexps distributions, params must be a 3 x 1 vector.');
  end
  if((strcmp(distrib,'gamma') || strcmp(distrib,'lognormal')|| strcmp(distrib,'Pareto') || strcmp(distrib,'Weibull')) && (length(params))~=2)
   	error('simNHPPALP: for gamma, lognormal, Pareto and Weibull distributions, params must be a 2 x 1 vector.');
  end
  if(strcmp(distrib,'exponential') && (length(params))~=1)
   	error('simNHPPALP: for exponential distribution, params must be a scalar.');
  end
  if(strcmp(distrib, 'exponential')==0 && strcmp(distrib, 'gamma')==0 && strcmp(distrib, 'mixofexps')==0 && strcmp(distrib,'Weibull')==0 && strcmp(distrib, 'lognormal')==0 && strcmp(distrib,'Pareto')==0 && strcmp(distrib,'Burr')==0)
   	error('simNHPPALP: distribs should be: exponential, gamma, mixofexps, Weibull, lognormal, Pareto or Burr');
  end
  poisproc = simNHPP(lambda,parlambda,T,N);
  rpp      = size(poisproc,1);
  cpp      = size(poisproc,2);
  losses   = zeros(rpp,cpp);
  
  switch distrib
      case 'Burr'
    i = 1;
    while(i<=N)
    	aux = min(find(poisproc(:,i,1)==T,i,'first'));
      if(aux>2)
        laux            = cumsum(Burrrnd(params(1),params(2),params(3),aux/2-1,1));
        losses(3:aux,i) = laux(ceil((1:(aux-2))/2));
        if(aux<rpp)
          losses((aux+1):rpp,i) = laux(length(laux))*ones(rpp-aux,1);
        end
      else
        losses(:,i)=zeros(rpp,1);
      end
      i = i + 1;
    end
      case'exponential'
    i = 1;
    while(i<=N)
        aux = min(find(poisproc(:,i,1)==T,i,'first'));
      if(aux>2)
        laux = cumsum(exprnd(1/params(1),aux/2-1,1));
        losses(3:aux,i) = laux(ceil((1:aux-2)/2));
        if(aux<rpp)
          losses((aux+1):rpp,i) = laux(length(laux))*ones(rpp-aux,1);
        end
      else
        losses(:,i)=zeros(rpp,1);
      end
      i = i + 1;
    end
      case 'gamma'
    i = 1;
    while(i<=N)
    	aux = min(find(poisproc(:,i,1)==T,i,'first'));
      if(aux>2)
        laux = cumsum(gamrnd(params(1),(1/params(2)),aux/2-1,1));
        losses(3:aux,i) = laux(ceil((1:aux-2)/2));
        if(aux<rpp)
          losses((aux+1):rpp,i) = laux(length(laux))*ones(rpp-aux,1);
        end
      else
        losses(:,i) = zeros(rpp,1);
      end
      i = i + 1;
    end
      case 'lognormal'
    i = 1;
    while(i<=N)
    	aux = min(find(poisproc(:,i,1)==T,i,'first'));
      if(aux>2)
        laux = cumsum(lognrnd(params(1),params(2),aux/2-1,1));
        losses(3:aux,i) = laux(ceil((1:aux-2)/2));
        if(aux<rpp)
          losses((aux+1):rpp,i) = laux(length(laux))*ones(rpp-aux,1);
        end
      else
        losses(:,i) = zeros(rpp,1);
      end
      i = i + 1;
    end
      case 'mixofexps'
    i = 1;
    while(i<=N)
    	aux = min(find(poisproc(:,i,1)==T,i,'first'));
      if(aux>2)
        laux = cumsum(mixexprnd(params(1),params(2),params(3),aux/2-1,1));
        losses(3:aux,i) = laux(ceil((1:aux-2)/2));
        if(aux<rpp)
          losses((aux+1):rpp,i) = laux(length(laux))*ones(rpp-aux,1);
        end
      else
        losses(:,i) = zeros(rpp,1);
      end
      i = i + 1;
    end
      case 'Pareto'
    i = 1;
    while(i<=N)
    	aux = min(find(poisproc(:,i,1)==T,i,'first'));
      if(aux>2)
        laux = cumsum(Paretornd(params(1),params(2),aux/2-1,1));
        losses(3:aux,i) = laux(ceil((1:aux-2)/2));
        if(aux<rpp)
          losses((aux+1):rpp,i) = laux(length(laux))*ones(rpp-aux,1);
        end
      else
        losses(:,i) = zeros(rpp,1);
      end
      i = i + 1;
    end
      case 'Weibull'
    i = 1;
    while(i<=N)
    	aux = min(find(poisproc(:,i,1)==T,i,'first'));
      if(aux>2)
        laux=cumsum(wblrnd(params(1)^(-1/params(2)),params(2),aux/2-1,1));
        losses(3:aux,i) = laux(ceil((1:aux-2)/2));
        if(aux<rpp)
          losses((aux+1):rpp,i) = laux(length(laux))*ones(rpp-aux,1);
        end
      else
        losses(:,i) = zeros(rpp,1);
      end
      i = i + 1;
    end
  end
   	y        = zeros(size(poisproc));
  	y(:,:,1) = poisproc(:,:,1);
    y(:,:,2) = losses;
  
end

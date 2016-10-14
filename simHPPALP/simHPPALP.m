% ---------------------------------------------------------------------
% Book:        STF
% ---------------------------------------------------------------------
% See also:    simHPP, simNHPPALP
% ---------------------------------------------------------------------
% Quantlet:    simHPPALP
% ---------------------------------------------------------------------
% Description: simHPPALP generates aggregate loss process driven by
%              the homogeneous Poisson process.
% ---------------------------------------------------------------------
% Usage:       y = simHPPALP(lambda,distrib,params,T,N)
% ---------------------------------------------------------------------
% Input:       
% Parameter:   lambda
% Definition:  scalar, intensity of the Poisson process
% Parameter:   distrib
% Definition:  string, claim size distribution
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
% Definition:  2*max+2 x N x 2 array, generated proecss - max is the
%              maximum number of jumps for all generated trajectories 
% ---------------------------------------------------------------------
% Example:
%             y1 = simHPPALP(3,'Burr',[3,2,1],5,1);
%             y2 = simHPPALP(3,'Pareto',[1.5,2.5],5,1);
%             plot(y1(:,:,1),y1(:,:,2),'r-')
%             hold on
%             ylim([min(min(y1(:,:,2)),min(y2(:,:,2))),max(max(y1(:,:,2)),max(y2(:,:,2)))])
%             plot(y2(:,:,1),y2(:,:,2),'b-')
%             box on
%             hold off
% ---------------------------------------------------------------------
% Result:      Show two trajectories of aggregate loss process driven
%              by the homogeneous Poisson process. 
% ---------------------------------------------------------------------
% Keywords:    Poisson process, risk process
% ---------------------------------------------------------------------
% Reference:   K. Burnecki, R.Weron (2004) 'Modeling of the risk process',
%	           in 'Statistical Tools for Finance and Insurance', 
%              eds. P. Cizek, W. Härdle, R. Weron, Springer. 
% ---------------------------------------------------------------------
% Author:      Awdesch Melzer 20130731
% ---------------------------------------------------------------------



function [y] = simHPPALP(lambda,distrib,params,T,N)
  
if(lambda <= 0 || (length(lambda)~=1))
	error('simHPPALP: Lambda must be a positive scalar.');
end
if(T <= 0 || (length(T)~=1))
	error('simHPPALP: T must be a positive scalar.');
end
if(N <= 0 || (length(N)~=1))
	error('simHPPALP: N must be a positive scalar.');
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

  poisproc = simHPP(lambda,T,N);
  rpp      = size(poisproc,1);
  cpp      = size(poisproc,2);
  losses   = zeros(rpp,cpp);
  
  switch distrib
      case 'Burr'
    i = 1;
    while(i<=N)
      aux = min(find(poisproc(:,i,1)==T,i));
      if(aux>2)
        laux                   = cumsum(Burrrnd(params(1),params(2),params(3),aux/2-1,1));
        losses(3:aux,i)        = laux(ceil((1:(aux-2))/2));
        if(aux<rpp)
          losses((aux+1):rpp,i)= laux(length(laux))*ones(rpp-aux,1);
        end
      else
        losses(:,i)=zeros(rpp,1);
      end
      i=i+1;
    end
      case 'exponential'
    i = 1;
    while(i<=N)
      aux = min(find(poisproc(:,i,1)==T,i));
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
    	aux = min(find(poisproc(:,i,1)==T,i));
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
    	aux = min(find(poisproc(:,i,1)==T,i));
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
    	aux = min(find(poisproc(:,i,1)==T,i));
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
    	aux = min(find(poisproc(:,i,1)==T,i));
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
    	aux = min(find(poisproc(:,i,1)==T,i));
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
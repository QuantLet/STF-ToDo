% ---------------------------------------------------------------------
% See also:    BondCoupon, BondOnlyCoupon, BondZeroCoupon
% ---------------------------------------------------------------------
% Quantlet:    BondZeroCouponHPP
% ---------------------------------------------------------------------
% Description: computes price of the zero-coupon CAT bond for the given 
%              claim amount distribution and the homogeneous 
%              Poisson process governing the flow of losses
% ---------------------------------------------------------------------
% Usage:       y = BondZeroCouponHPP(Z,D,T,r,lambda,distr,params,Tmax,N)
% ---------------------------------------------------------------------
% Input:       
% Parameter:   Z
% Definition:  scalar, payment at maturity
% Parameter:   D
% Definition:  n1 x 1 vector, threshold level 
% Parameter:   T
% Definition:  n2 x 1 vector, time to expiry 
% Parameter:   r
% Definition:  scalar, continuously-compounded discount rate 
% Parameter:   lambda
% Definition:  scalar, intensity of the Poisson process
% Parameter:   distr
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
% Parameter:   Tmax
% Definition:  scalar, time horizon
% Parameter:   N
% Definition:  scalar, number of trajectories
% ---------------------------------------------------------------------
% Output:     
% Parameter:   y
% Definition:  m x 3 matrix, the first column are times to bond's expiration,
%              the second threshold levels and the third corresponding prices of the bond 
% ---------------------------------------------------------------------
% Example:    
% ---------------------------------------------------------------------
% Result:      
% ---------------------------------------------------------------------
% Keywords:    CAT bond
% ---------------------------------------------------------------------
% Reference:   K. Burnecki, G. Kukla, D. Taylor (2005) 'Pricing of catastrophe bonds ',
%	           in 'Statistical Tools for Finance and Insurance', 
%              eds. P. Cizek, W. Härdle, R. Weron, Springer. 
% ---------------------------------------------------------------------
% Author:      Awdesch Melzer 20130731
% ---------------------------------------------------------------------



function [y] = BondZeroCouponHPP(Z,D,T,r,lambda,distr,params,Tmax,N)
 
  if(lambda <= 0 || length(lambda)~=1)
  	error('BondZeroCouponHPP: Lambda must be a positive scalar.');
  end
  if(length(Z) ~=1)
  	error('BondZeroCouponHPP: payment at maturity Z needs to be a scalar');
  end
  if(length(r) ~=1)
  	error('BondZeroCouponHPP: discount rate needs to be a scalar');
  end
  if(length(D)==1)
  	error('BondZeroCouponHPP: threshold level D needs to be a vector ');
  end
  if(length(T)==1)
  	eror('BondZeroCouponHPP: time to expiry T needs to be a vector ');
  end
  x   = simHPPALP(lambda,distr,params,Tmax,N);
  Tl  = length(T);
  Dl  = length(D);
  y   = zeros(Tl*Dl,3);
  i   = 1; %loop (times to maturity)
  j   = 1; %loop (treshold levels)
  k   = 1; %loop (trajectories)
  wyn = 0;
  while(i<=Tl)
    while(j<=Dl)
      while(k<=N)
        traj = [x(:,k,1),x(:,k,2)];
        wyn  = wyn+(traj(length(traj(find(traj(:,1)<=T(i)),1)),2)<=D(j));
        k    = k + 1;
      end
      y((i-1)*Dl+j,1) = T(i);
      y((i-1)*Dl+j,2) = D(j);
      y((i-1)*Dl+j,3) = Z*exp(-r*T(i))*wyn/N;
      wyn = 0;
      k   = 1;
      j   = j + 1;
    end
    j = 1;
    i = i + 1;
  end
end



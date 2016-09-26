% ---------------------------------------------------------------------
% Book:        STF
% ---------------------------------------------------------------------
% See also:    BondCoupon, BondOnlyCoupon, BondZeroCouponHPP
% ---------------------------------------------------------------------
% Quantlet:    BondZeroCoupon
% ---------------------------------------------------------------------
% Description: BondZeroCoupon computes price of the zero-coupon CAT bond 
%              for the given claim amount distribution and the non-homogeneous 
%              Poisson process governing the flow of losses. 
% ---------------------------------------------------------------------
% Usage:       y = BondZeroCoupon(Z,D,T,r,lambda,parlambda,distr,params,Tmax,N)
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
% Definition:  scalar, intensity function
%              if lambda=0, a sine function
%              if lambda=1, a linear function
%              if lambda=2, a sine square function
% Parameter:   parlambda
% Definition:  n x 1 vector, parameters of the intensity function lambda 
%              (n=2 for lambda=1, n=3 otherwise)
% Parameter:   distrib
% Definition:  string, claim size distribution
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
%              the second threshold levels and the third corresponding
%              prices of the bond 
% ---------------------------------------------------------------------
% Example:     
%             Z = 1;
%             D = [1e9,2e9];
%             T = [1,2];
%             r = log(1.025);
%             lambda = 0;
%             parlambda = [39,14,-0.2];
%             distr  = 'Burr';
%             params = [0.5,4*1e16,5];
%             Tmax   = max(T);
%             N  = 20;
%             d1 = BondZeroCoupon(Z,D,T,r,lambda,parlambda,distr,params,Tmax,N);
%             d1
% ---------------------------------------------------------------------
% Result:      Contents of d1
%             [1,]        1    1e+09  0.97561 
%             [2,]        1    2e+09  0.97561 
%             [3,]        2    1e+09  0.95181 
%             [4,]        2    2e+09  0.95181 
% ---------------------------------------------------------------------
% Keywords:    CAT bond 
% ---------------------------------------------------------------------
% Reference:   K. Burnecki, G. Kukla, D. Taylor (2005) 'Pricing of catastrophe bonds ',
%	           in 'Statistical Tools for Finance and Insurance', 
%              eds. P. Cizek, W. Härdle, R. Weron, Springer.
% ---------------------------------------------------------------------
% Author:      Awdesch Melzer 20130727
% ---------------------------------------------------------------------

function [y] = BondZeroCoupon(Z,D,T,r,lambda,parlambda,distr,params,Tmax,N)

  if(lambda ~= 0 && lambda ~= 1 && lambda~=2)
  	error('BondZeroCoupon: Lambda must be either 0,1 or 2.')
  end
  if(length(Z) ~=1)
  	error('BondZeroCoupon: payment at maturity Z needs to be a scalar')
  end
  if(length(r) ~=1)
  	error('BondZeroCoupon: discount rate needs to be a scalar')
  end
  if(length(D)==1)
  	error('BondZeroCoupon: threshold level D needs to be a vector ')
  end
  if(length(T)==1)
  	error('BondZeroCoupon: time to expiry T needs to be a vector ')
  end

  
  x   = simNHPPALP(lambda,parlambda,distr,params,Tmax,N);
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
        wyn  = wyn + (traj(length(traj(find(traj(:,1)<=T(i)),1)),2)<=D(j));
        k = k+1;
      end
      y((i-1)*Dl+j,1) = T(i);
      y((i-1)*Dl+j,2) = D(j);
      y((i-1)*Dl+j,3) = Z*exp(-r*T(i))*wyn/N;
      wyn = 0;
      k   = 1;
      j   = j+1;
    end
    j = 1;
    i = i+1;
  end
  y = y;
  
end


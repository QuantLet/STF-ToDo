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



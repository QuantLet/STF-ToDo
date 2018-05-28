[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **simHPP** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: simHPP

Published in: Statistical Tools for Finance and Insurance

Description: 'Generates N trajectories of the homogeneous Poisson process with intensity LAMBDA. T is the time horizon. A function required by STFloss01.'

Keywords: poisson, Poisson process, simulation, stochastic-process, stochastic

See also: STFloss01, STFloss10, simNHPP

Author: Joanna Janczura

Submitted: Tue, October 09 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function y = simHPP(lambda,T,N)
% SIMHPP Homogeneous Poisson process.
%       Y = SIMHPP(lambda,T,N) generates N trajectories of the
%       homogeneous Poisson process with intensity LAMBDA. T is the time
%       horizon. 

  if lambda <= 0
    error('simHPP: Lambda must be a positive real number');
  end
  if T <= 0
    error('simHPP: T must be a positive real number');
  end
  EN = poissrnd(lambda*T,N,1);
max(EN) ;
  y=T*ones(max(EN)+1,N);
  i=1;
  while(i<=N)
      y(1,i)=0;
    if EN(i)>0
      y(2:EN(i)+1,i)=sort(T*rand(EN(i),1)); 
    end 
    i=i+1;
  end


```

automatically created on 2018-05-28
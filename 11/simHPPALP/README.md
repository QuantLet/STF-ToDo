<div style="margin: 0; padding: 0; text-align: center; border: none;">
<a href="https://quantlet.com" target="_blank" style="text-decoration: none; border: none;">
<img src="https://github.com/StefanGam/test-repo/blob/main/quantlet_design.png?raw=true" alt="Header Image" width="100%" style="margin: 0; padding: 0; display: block; border: none;" />
</a>
</div>

```
Name of QuantLet: simHPPALP

Published in: Statistical Tools for Finance and Insurance

Description: 'Generates the aggregate loss process driven by the homogeneous Poisson process.'

Keywords: CAT bond, Poisson process, risk process, poisson, bond, risk

See also: 'BondZeroCouponHPP, BondZeroCouponHPP, Burrrnd, Paretornd, STFcat08, STFcat08, mixexprnd, simHPP, simNHPPALP'

Author: Awdesch Melzer

Submitted: Tue, August 06 2013 by Awdesch Melzer

Input: 'lambdascalar: intensity of the Poisson process

distribstring: claim size distribution

"Burr": Burr distribution

"exponential": exponential distribution

"gamma": gamma distribution

"lognormal": lognormal distribution

"mixofexps": mix of exponential distributions

"Pareto": Pareto distribution

"Weibull": Weibull distribution

paramsn: x 1- vector, parameters of the claim size distribution

Tscalar: time horizon

Ninteger: number of trajectories'

Output: 'y: (2*max+2) x N x 2 array, generated proecss: max is the maximum number of jumps for all generated trajectories'

Example: 'Show two trajectories of aggregate loss process driven by the homogeneous Poisson process: y = simHPPALP(lambda,distrib,params,T,N)

R: 

MatLab: 

plot(y1(: ,:,1),y1(:,:,2),"r-")

ylim([min(min(y1(: ,:,2)),min(y2(:,:,2))),max(max(y1(:,:,2)),max(y2(:,:,2)))])

plot(y2(: ,:,1),y2(:,:,2),"b-")

```
<div align="center">
<img src="https://raw.githubusercontent.com/QuantLet/STF-ToDo/master/11/simHPPALP/plotR.png" alt="Image" />
</div>

<div align="center">
<img src="https://raw.githubusercontent.com/QuantLet/STF-ToDo/master/11/simHPPALP/plotm.png" alt="Image" />
</div>


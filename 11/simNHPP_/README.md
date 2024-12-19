<div style="margin: 0; padding: 0; text-align: center; border: none;">
<a href="https://quantlet.com" target="_blank" style="text-decoration: none; border: none;">
<img src="https://github.com/StefanGam/test-repo/blob/main/quantlet_design.png?raw=true" alt="Header Image" width="100%" style="margin: 0; padding: 0; display: block; border: none;" />
</a>
</div>

```
Name of QuantLet: simNHPP_

Published in: Statistical Tools for Finance and Insurance

Description: 'Generates non-homogeneous Poisson process and plot 2 trajectories from non-homogeneous processes.'

Keywords: poisson, Poisson process, risk, risk management, stochastic-process, stochastic

See also: 'BondCoupon, BondCoupon, BondOnlyCoupon, BondOnlyCoupon, BondZeroCoupon, STFcat02, STFcat04, STFcat04, STFcat05, STFcat05, STFcat06, STFcat06, STFcat07, STFcat07, STFcat08, STFcat08, STFcat09, STFcat09, quantilelines, simHPP, simNHPPALP, simNHPPALP'

Author: Awdesch Melzer

Submitted: Tue, August 06 2013 by Awdesch Melzer

Input: 'lamda: scalar, intensity function, sine function (lambda=0) linear function (lambda=1) or sine square function (lambda=2)

parlambda: n x 1 vector, parameters of the intensity function lambda (n = 2 for lambda = 1, n = 3 otherwise)

N: scalar, number of trajectories

T: scalar, time horizon'

Output: 'y: (2*max+2) x N x 2 array, generated process: max is the maximum number of jumps for all generated trajectories'

Example: 'Show two trajectories of non-homogeneous Poisson process: y = simNHPP(lambda,parlambda,T,N)

R: 

MatLab: 

plot(y1(: ,:,1),y1(:,:,2),"r-")

ylim([min(min(y1(: ,:,2)),min(y2(:,:,2))),max(max(y1(:,:,2)),max(y2(:,:,2)))])

line(y2(: ,:,1),y2(:,:,2))'

```
<div align="center">
<img src="https://raw.githubusercontent.com/QuantLet/STF-ToDo/master/11/simNHPP_/plotR.png" alt="Image" />
</div>

<div align="center">
<img src="https://raw.githubusercontent.com/QuantLet/STF-ToDo/master/11/simNHPP_/plotm.png" alt="Image" />
</div>


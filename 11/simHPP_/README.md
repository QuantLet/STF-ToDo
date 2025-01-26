<div style="margin: 0; padding: 0; text-align: center; border: none;">
<a href="https://quantlet.com" target="_blank" style="text-decoration: none; border: none;">
<img src="https://github.com/StefanGam/test-repo/blob/main/quantlet_design.png?raw=true" alt="Header Image" width="100%" style="margin: 0; padding: 0; display: block; border: none;" />
</a>
</div>

```
Name of QuantLet: simHPP_

Published in: Statistical Tools for Finance and Insurance

Description: Generates and plots an homogeneous Poisson process with an intensity lambda.

Keywords: Poisson process, risk process, poisson, plot, visualization, graphical representation

See also: BondCoupon, BondCoupon, BondOnlyCoupon, BondOnlyCoupon, BondZeroCoupon, BondZeroCouponHPP, BondZeroCouponHPP, STFcat02, STFcat04, STFcat04, STFcat05, STFcat05, STFcat06, STFcat06, STFcat07, STFcat07, STFcat08, STFcat08, STFcat09, STFcat09, quantilelines, simHPPALP, simHPPALP, simNHPP, simNHPP, simNHPPALP, simNHPPALP

Author: Awdesch Melzer

Submitted: Tue, August 06 2013 by Awdesch Melzer

Input: lambda: scalar, intensity of the Poisson process

T: scalar, time horizon

N: scalar, number of trajectories

Output: y: (2*max+2) x N x 2 array, generated process: max is the maximum number of jumps for all generated trajectories

Example: Show two trajectories of homogeneous Poisson process: y = simHPP(lambda,T,N)

R: 

MatLab: 

plot(y1(: ,:,1),y1(:,:,2),"r-")

ylim([min(min(y1(: ,:,2)),min(y2(:,:,2))),max(max(y1(:,:,2)),max(y2(:,:,2)))])

line(y2(: ,:,1),y2(:,:,2))

```
<div align="center">
<img src="https://raw.githubusercontent.com/QuantLet/STF-ToDo/master/11/simHPP_/plotR.png" alt="Image" />
</div>

<div align="center">
<img src="https://raw.githubusercontent.com/QuantLet/STF-ToDo/master/11/simHPP_/plotm.png" alt="Image" />
</div>


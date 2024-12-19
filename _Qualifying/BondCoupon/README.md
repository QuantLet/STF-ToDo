<div style="margin: 0; padding: 0; text-align: center; border: none;">
<a href="https://quantlet.com" target="_blank" style="text-decoration: none; border: none;">
<img src="https://github.com/StefanGam/test-repo/blob/main/quantlet_design.png?raw=true" alt="Header Image" width="100%" style="margin: 0; padding: 0; display: block; border: none;" />
</a>
</div>

```
Name of QuantLet: BondCoupon

Published in: Statistical Tools for Finance and Insurance

Description: 'Computes the price of the coupon-bearing CAT bond for the given claim amount distribution and non-homogeneous Poisson process governing the flow of losses.'

Keywords: CAT bond, bond, poisson process, loss function, loss-distribution

See also: Burrrnd, Paretornd, STFcat06, STFcat06, STFcat07, mixexprnd, simHPP, simNHPP, simNHPPALP

Author: Awdesch Melzer

Submitted: Tue, August 06 2013 by Awdesch Melzer

Input: 'Cscalar- coupon payments (cease at the threshold time or Tmax)

Output: 'ym x 3- matrix, the first column are times to bond"s expiration, the second threshold levels and the third corresponding prices of the bond'

Example: 'y = BondCoupon(Z,C,D,T,r,lambda,parlambda,distr,params,Tmax,N)

Result: Contents of d1

```

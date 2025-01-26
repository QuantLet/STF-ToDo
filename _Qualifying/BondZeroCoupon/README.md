<div style="margin: 0; padding: 0; text-align: center; border: none;">
<a href="https://quantlet.com" target="_blank" style="text-decoration: none; border: none;">
<img src="https://github.com/StefanGam/test-repo/blob/main/quantlet_design.png?raw=true" alt="Header Image" width="100%" style="margin: 0; padding: 0; display: block; border: none;" />
</a>
</div>

```
Name of QuantLet: BondZeroCoupon

Published in: Statistical Tools for Finance and Insurance

Description: Computes price of the zero-coupon CAT bond for the given claim amount distribution and the non-homogeneous Poisson process governing the flow of losses.

Keywords: CAT bond, zero-coupon, bond, poisson process, loss function, loss-distribution

See also: BondOnlyCoupon, STFcat04, STFcat04, STFcat05, STFcat06, STFcat07, STFcat07, STFcat08, STFcat08, STFcat09, STFcat09

Author: Awdesch Melzer

Submitted: Tue, August 06 2013 by Awdesch Melzer

Input: Tn2 x 1- vector, time to expiry

distribstring- claim size distribution: 

Output: ym x 3- matrix, the first column are times to bond"s expiration, the second threshold levels and the third corresponding prices of the bond

Example: y = BondZeroCoupon(Z,D,T,r,lambda,parlambda,distr,params,Tmax,N)

Result: Contents of d1

```

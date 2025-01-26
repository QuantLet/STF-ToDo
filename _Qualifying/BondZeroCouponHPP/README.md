<div style="margin: 0; padding: 0; text-align: center; border: none;">
<a href="https://quantlet.com" target="_blank" style="text-decoration: none; border: none;">
<img src="https://github.com/StefanGam/test-repo/blob/main/quantlet_design.png?raw=true" alt="Header Image" width="100%" style="margin: 0; padding: 0; display: block; border: none;" />
</a>
</div>

```
Name of QuantLet: BondZeroCouponHPP

Published in: Statistical Tools for Finance and Insurance

Description: Computes price of the zero-coupon CAT bond for the given claim amount distribution and the homogeneous Poisson process governing the flow of losses.

Keywords: CAT bond, bond, poisson process, loss function, loss-distribution, zero-coupon

See also: Burrrnd, Paretornd, STFcat08, STFcat08, mixexprnd, simHPP, simHPPALP

Author: Awdesch Melzer

Submitted: Sun, June 30 2013 by Awdesch Melzer

Input: Zscalar- payment at maturity

Output: y- m x 3 matrix, the first column are times to bond"s expiration, the second threshold levels and the third corresponding prices of the bond

Example: y = BondZeroCouponHPP(Z,D,T,r,lambda,distr,params,Tmax,N)

Result: Contents of d1

```

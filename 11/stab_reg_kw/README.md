<div style="margin: 0; padding: 0; text-align: center; border: none;">
<a href="https://quantlet.com" target="_blank" style="text-decoration: none; border: none;">
<img src="https://github.com/StefanGam/test-repo/blob/main/quantlet_design.png?raw=true" alt="Header Image" width="100%" style="margin: 0; padding: 0; display: block; border: none;" />
</a>
</div>

```
Name of QuantLet: stab_reg_kw

Published in: Statistical Tools for Finance and Insurance

Description: Estimates the parameters of an alpha-stable distribution under parameterisations S1 using the Kogon-Williams method (1998).

Keywords: Kogon-Williams, estimation, stable, stable distribution, distribution

See also: fractal_hurst, mc_culloch, sim_stable, stabreg

Author: Daniel T. Pele

Submitted: Sat, March 15 2014 by Lukas Borke

Input: error: maximum error for convergence (usually is 0.01)

maxiter: maximum number of iterations (usually is 100)

var: variable used for estimation

data: SAS dataset containing the variables

Output: delta: location parameter

res: SAS dataset containing the estimated parameters

beta: skewness

alpha: stability index

gamma: scale parameter

Example: An example is generated for a simulated stable distribution S(alpha=1.5,beta=0,delta=0,gamma=1).

```

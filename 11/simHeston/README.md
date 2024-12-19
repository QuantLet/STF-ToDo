<div style="margin: 0; padding: 0; text-align: center; border: none;">
<a href="https://quantlet.com" target="_blank" style="text-decoration: none; border: none;">
<img src="https://github.com/StefanGam/test-repo/blob/main/quantlet_design.png?raw=true" alt="Header Image" width="100%" style="margin: 0; padding: 0; display: block; border: none;" />
</a>
</div>

```
Name of QuantLet: simHeston

Published in: Statistical Tools for Finance and Insurance

Description: 'Samples trajectories of the spot price and volatility processes in the Heston model.'

Keywords: heston, simulation, price, economy, financial, volatility

See also: STFhes01, simGBM

Author: Rafal Weron

Submitted: Mon, April 11 2011 by Maria Osipenko

Input: 's0: starting value of the spot price process

N: time endpoint

mu: drift

v0: starting value of the volatility process

delta: time step size

KAPPA: speed of mean reversion of the volatility process

THETA: long-term mean of the volatility process

no: 2-column vector of normally distributed pseudorandom numbers

SIGMA: volatility

RHO: correlation between the spot price and volatility processes

Output: simulation of Geometric Brownian Motion

Example: simHeston(1,4,0.04,0.02,2,0.04,0.3,-0.05,0.01)

```

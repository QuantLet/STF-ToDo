<div style="margin: 0; padding: 0; text-align: center; border: none;">
<a href="https://quantlet.com" target="_blank" style="text-decoration: none; border: none;">
<img src="https://github.com/StefanGam/test-repo/blob/main/quantlet_design.png?raw=true" alt="Header Image" width="100%" style="margin: 0; padding: 0; display: block; border: none;" />
</a>
</div>

```
Name of QuantLet: quantilelines

Published in: Statistical Tools for Finance and Insurance

Description: 'Computes quantiles of trajectories and plots quantiles and median of a trajectory of a homogeneous poisson process.'

Keywords: risk process, risk, quantile, plot, visualization, median, descriptive, Poisson process

See also: STFcat02, simHPP, simNHPP, simNHPPALP

Author: Awdesch Melzer

Submitted: Tue, August 06 2013 by Awdesch Melzer

Input: 'step: scalar, time interval between points at which the quantiles are computed

data: n x m x 2 array, data, where n is the length of trajectories and m the number of trajectories

perc: s x 1 vector, orders of quantiles'

Output: 'y: p x q matrix, where first column contains time and the remaining quantiles'

Example: 'y = quantilelines(data,step,perc)

plot(q(: ,1),q(:,4),"k-")

plot(y(: ,1,1),y(:,1,2),"r-")'

```
<div align="center">
<img src="https://raw.githubusercontent.com/QuantLet/STF-ToDo/master/11/quantilelines/plot.png" alt="Image" />
</div>


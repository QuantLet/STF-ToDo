[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **ultra** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: ultra

Published in: Statistical Tools for Finance and Insurance

Description: 'Calculates the ultrametric distance between time series. Auxiliary  matlab function, required by STFdmm02 - STFdmm10.'

See also: 'STFdmm02, STFdmm03, STFdmm04, STFdmm05, STFdmm06, STFdmm07, STFdmm08, STFdmm09, STFdmm10, manh, theil, umlp'

Keywords: distance, time-series, descriptive, proximity, risk

Author: Janusz Miskiewicz

Submitted: Mon, November 05 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function retval=ultra(x)
% Ultrametric distance between time series.
% x - time series matrix
% 
% Author: Janusz Miśkiewicz, email: jamis@ift.uni.wroc.pl
  [h,k]=size(x);
  retval= sqrt(abs(0.5*(ones(k)-corr(x))));
end
```

automatically created on 2018-05-28
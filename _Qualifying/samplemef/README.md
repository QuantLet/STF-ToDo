[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **samplemef** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: samplemef

Published in: Statistical Tools for Finance and Insurance

Description: 'Returns the value of the sample mean excess function for the vector DATA in the points from vector XAXIS. A function required by STFloss08.'

Keywords: loss function, loss-distribution, risk, risk management, risk process, 

See also: STFloss08

Author: Joanna Janczura

Submitted: Tue, October 09 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function res=samplemef(data, xaxis)
% SAMPLEMEF Sample mean excess function. 
%   RES = SAMPLEMEF (DATA, XAXIS) returns the value of the sample 
%   mean excess function for the vector DATA in the points from vector XAXIS.


sorteddata  = sort (data);
dataLength  =length(sorteddata);
resLength   = length(xaxis);
res         = xaxis;


i=0;
valuesOnTheLeft = 0;
smef = mean (sorteddata(1:dataLength));

while ( i < resLength )
  i = i + 1;
  while (sorteddata(valuesOnTheLeft+1) < xaxis(i))
    valuesOnTheLeft = valuesOnTheLeft + 1;
  end
  smef = mean (sorteddata(valuesOnTheLeft+1:dataLength));
  res(i) = smef - xaxis(i);
end

```

automatically created on 2018-05-28
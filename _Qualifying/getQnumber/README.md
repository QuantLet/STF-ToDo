[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **getQnumber** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: getQnumber

Published in: Statistical Tools for Finance and Insurance

Description: 'Returns quarterly number of losses. Auxiliary function required by STFloss09'

Keywords: loss function, frequency, counts, relative frequency, loss-distribution

Author: Joanna Janczura

See also: STFloss09

Submitted: Tue, October 09 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function y=getQnumber(x)
% GETQNUMBER Auxiliary function for STF2loss10
%      y=getQnumber(x) returns the quarterly number of losses. 
         
maxx = max(x);
l = length(x);
y = zeros(maxx,1);
i = 1;
q = 1;

while (i<=l)
  if (x(i)==q)
      y(q) = y(q)+1;
      i = i+1;
  else
      q = q+1;
  end
end
  


```

automatically created on 2018-05-28
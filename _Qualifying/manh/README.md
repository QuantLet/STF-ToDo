[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **manh** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: manh

Published in: Statistical Tools for Finance and Insurance

Description: 'Gives the Manhattan distance between time series normalised by the time series length. A function required by STFdmm11.R. and STFdmm11.m'

Keywords: time-series, distance, manhattan metric, proximity, financial

See also: 'STFdmm11, STFdmm12, STFdmm13, STFdmm14, STFdmm15, bmlp, mst, theil, ultra, umlp'

Author: Janusz Miskiewicz

Submitted: Wed, November 21 2012 by Dedy Dwi Prastyo










```

### R Code
```r

manh = function(x){
# Manhattan distence between time series normalised by the time series
# length.
# x - time series
#
x      = as.matrix(x)
h      = nrow(x)
k      = ncol(x)
result = matrix(0,k,k)
for (j in 1:k){
  for (i in 1:k){
	result[i,j] = abs(mean(x[,i]-x[,j]))
  }
}
retval= result
}
```

automatically created on 2018-05-28

### MATLAB Code
```matlab

function retval=manh(x)
% Manhattan distence between time series normalised by the time series
% length.
% x - time series
%
% Author: Janusz Miśkiewicz, email: jamis@ift.uni.wroc.pl
[h,k]=size(x);
result=zeros(k);
for j=1:k
  for i=1:k
	result(i,j)=abs(mean(x(:,i)-x(:,j)));
  end;
end;
retval= result;
end
```

automatically created on 2018-05-28
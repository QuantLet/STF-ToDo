[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **theil** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: theil

Published in: Statistical Tools for Finance and Insurance

Description: 'Converts the given time series into time series of Theil index. A function required by STFdmm11.R.'

See also: STFdmm11, STFdmm12, STFdmm13, STFdmm14, STFdmm15, bmlp, manh, mst, ultra, umlp

Keywords: time-series, index, economy, distribution, financial

Author: Janusz Miskiewicz, Awdesch Melzer

Submitted: Wed, November 21 2012 by Dedy Dwi Prastyo


```

### R Code
```r

theil = function(x,n){
# Converts the given time series into time series of Theil index
# n - size of moving window
# x - analysed time series
#
x         = as.matrix(x)
n_pocz    = nrow(x)
k         = ncol(x)

rozm      = n_pocz-n+1

retval    = matrix(0,rozm,k)
    for (i in 1:rozm){
    	sr          = apply(x[i:(i+n-1),],2,mean)
    	temp        = x[i:(i+n-1),]/(matrix(1,n,1)%*%sr)
    	temp        = temp*log(temp)
    	retval[i,]  = apply(temp,2,mean)
    }
}
```

automatically created on 2018-05-28

### MATLAB Code
```matlab

function retval=theil(x,n)
% Converts the given time series into time series of Theil index
% n - size of moving window
% x - analysed time series
%
% Author: Janusz Miśkiewicz, email: jamis@ift.uni.wroc.pl
[n_pocz,k]=size(x);
rozm=n_pocz-n+1;
retval=zeros(rozm,k);
    for i=1:rozm
    	sr=mean(x(i:i+n-1,:));
    	temp=x(i:i+n-1,:)./(ones(n,1)*sr);
    	temp=temp.*log(temp);
    	retval(i,:)=mean(temp);
    end;
end
```

automatically created on 2018-05-28
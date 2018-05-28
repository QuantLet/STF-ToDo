[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **quantiles** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: quantiles 

Published in: Statistical Tools for Finance and Insurance

Description: 'Computes quantile lines of the risk process specified by [T, DATA] in equally spaced points with the step size specified by STEP. PERC is the vector with orders of quantiles. A function reuqired by STFloss10.'

Keywords: quantile, risk, risk process, distribution, descriptive

Author: Joanna Janczura

See also: STFloss10

Submitted: Tue, October 09 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function [vecstep,y]=quantiles(t,data,step,perc)
%QUANTILES Risk process quantile lines .
%       [vecstep,y]=quantiles(t,data,step,perc) computes quantile lines of 
%       the risk process specified by [T, DATA] in equally spaced points 
%       with the step size specified by STEP. PERC is the vector with 
%       orders of quantiles.

  if nargin<3
    perc=(1:9)/10';
  end
  [N,R]=size(data);  
  begin=t(1,1);
  theend=t(N,1);
  numofpoints=(theend-begin)/step+1;
  vecstep=begin:step:theend;
%   y=zeros(1,length(perc));
  i=2;
  val=zeros(R,numofpoints);
  while(i<numofpoints)
    j=1;
    while(j<=R)
      ind=find(t(:,j)<vecstep(i),1,'last');
      val(j,i)=data(ind,j)+(vecstep(i)-t(ind,j))*(data(ind+1,j)-data(ind,j))/(t(ind+1,j)-t(ind,j));
      j=j+1;
    end
    i=i+1;
  end
  j=1;
    while(j<=R)
      val(j,end)=data(end,j);
      val(j,1)=data(1,j);
      j=j+1;
    end
  val=sort(val);
  y=val(ceil(perc*R),:);


```

automatically created on 2018-05-28
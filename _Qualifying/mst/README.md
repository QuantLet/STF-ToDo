[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **mst** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: mst

Published in: Statistical Tools for Finance and Insurance

Description: 'Generates a minimum spanning tree. The result is presented as a set of links between nodes.'

Keywords: financial, distance, tree, portfolio, asset, visualization, descriptive-statistics

Author: Janusz Miśkiewicz

See also: 'STFdmm01, STFdmm02, STFdmm03, STFdmm04, STFdmm07, STFdmm10, STFdmm11, STFdmm12, STFdmm13, STFdmm14, STFdmm15, manh, theil, umlp' 

Submitted: Mon, November 05 2012 by Dedy Dwi Prastyo


```

### MATLAB Code
```matlab

function retval = mst(x)
% Algorithm generates minimum spanning tree
% The rsult is presentes as a set of links between nodes
%
% Author: Janusz Miśkiewicz, email: jamis@ift.uni.wroc.pl
[n,m]=size(x);
x=triu(x,1);
net=zeros(n-1,3);
onnet=zeros(n,1);
klaster=zeros(n,1);
klast=0;
licz=0;
%check if the matrics is symmetric and positive
maxx=max(max(x));
smax=10*abs(maxx);
x(x==0)=smax;
while (licz<n-1)
  minx=min(min(x));
  [i,j]=find(x<=minx);
  if (length(i) > 0) 
    ii=i(1);
    jj=j(1);
    i=[];
    j=[];
    i=ii;
    j=jj;
  end;
  if (onnet(i) ==0 && onnet(j) ==0)
    licz=licz+1;
    net(licz,1)=i;
    net(licz,2)=j;
    klast=klast+1;
    klaster(i)=klast;
    klaster(j)=klast;
    net(licz,3)=min(x(i,j),x(j,i));
    onnet(i)=1;
    onnet(j)=1;
    x(i,j)=smax;
    x(j,i)=smax;
  elseif (onnet(i)==0 && onnet(j)==1)  
    licz=licz+1;
    net(licz,1)=i;
    net(licz,2)=j;
    net(licz,3)=min(x(i,j),x(j,i));
    onnet(i)=1;
    klaster(i)=klaster(j);
    x(i,j)=smax;
    x(j,i)=smax;
  elseif (onnet(i) ==1 && onnet(j) ==0)  
    licz=licz+1;
    net(licz,1)=i;
    net(licz,2)=j;
    net(licz,3)=min(x(i,j),x(j,i));
    onnet(j)=1;
    klaster(j)=klaster(i);
    x(i,j)=smax;
    x(j,i)=smax;
  elseif (onnet(i) ==1 && onnet(j) ==1 && klaster(i)==klaster(j))  
    x(i,j)=smax;
    x(j,i)=smax;
  elseif  (onnet(i) ==1 && onnet(j) ==1 && klaster(i)~=klaster(j))
    licz=licz+1;
    net(licz,1)=i;
    net(licz,2)=j;
    net(licz,3)=min(x(i,j),x(j,i));
    klaster(klaster==klaster(i))=klaster(j);
  end;
end;
retval=net;
end
```

automatically created on 2018-05-28
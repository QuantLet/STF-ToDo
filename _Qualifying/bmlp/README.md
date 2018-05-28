[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **bmlp** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: bmlp

Published in: Statistical Tools for Finance and Insurance

Description: 'Contains bidirectional minimum length path (BMLP) algorithm. Result is a set of links between nodes.'

Keywords: tree, correlation, correlation-matrix, distance, similarity

Author: Janusz Miśkiewicz

See also: 'STFdmm02, STFdmm03, STFdmm04, STFdmm06, STFdmm09, STFdmm13, manh, theil, umlp'

Submitted: Mon, November 05 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function retval = bmlp(x)
% bidirextional minimum length path algoritm
% x - the distance matrix
%
% The rsult is presentes as a set of links between nodes
%
% Author: Janusz Miśkiewicz, email: jamis@ift.uni.wroc.pl
[n,m]=size(x);
net=zeros(n-1,3);
onnet=zeros(n,1);
end1=0;
end2=0;
licz=0;
% the distance matrics should be symmetric and positive
maxx=10*max(max(x));
smax=maxx*eye(size(x));
x=x+smax;
% the first pair
minx=min(min(x));
[i,j]=find(x==minx);
if (length(i) == 1)
  end1=i;
  end2=j;
  onnet(end1)=1;
  onnet(end2)=1;
  net(1,1)=end1;
  net(1,2)=end2;
  net(1,3)=minx;
  licz=1;
  x(end1,end2)=maxx;
  x(end2,end1)=maxx;
  else
  end1=i(1);
  end2=j(1);
  onnet(end1)=1;
  onnet(end2)=1;
  net(1,1)=end1;
  net(1,2)=end2;
  net(1,3)=minx;
  licz=1;
  x(end1,end2)=maxx;
  x(end2,end1)=maxx;
end;
while (licz<n-1)
   minx1=min(x(end1,:));
   minx2=min(x(end2,:));
   if (minx1 < minx2)
    y=end1;
    minx=minx1;
   else
    y=end2;
    minx=minx2;
   end;
  i=find(x(y,:)==minx);
   if (length(i) > 1)
      tmp=1;
      while ((onnet(i(tmp))==1) && (tmp < length(i)))
        tmp=tmp+1;
      end;
      if (onnet(i(tmp))==0)
    	ii=i(tmp);
    	i=[];
    	i=ii;
        tmp=0;
      else
    	ii=i(1);
        i=[];
    	i=ii;
      end;
   end;
    if (onnet(i) ==0 )
      licz=licz+1;
      net(licz,1)=y;
      net(licz,2)=i;
      net(licz,3)=x(i,y);
      onnet(i)=1;
      x(i,y)=maxx;
      x(y,i)=maxx;
      y=i;
    end;
     if ((onnet(i)==1) && (onnet(y)==1))
      x(i,y)=maxx;
      x(y,i)=maxx;
    end;
end;
retval=net;
end
```

automatically created on 2018-05-28
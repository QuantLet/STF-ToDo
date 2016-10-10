function [D,V,W2,A2]=cvBurr(n,m,alpha,lambda,tau,method,numberofiterations) 
% CVBURR  Simulated values of the EDF statistics for the Burr distribution.
%    [D,V,W2,A2]=CVBURR(N,M,ALPHA,LAMBDA,TAU,METHOD,NUMBERIFITERATIONS)
%    returns simulated values of the EDF statistics for the Burr distribution 
%    with given parameters ALPHA, LAMBDA, TAU. It uses M simulated samples
%    of length N and the chosen method of estimation (METHOD=1 - maximum
%    likelihood, METHOD=2 - A2 statistics minimalization).
%    NUMBEROFITERATIONS is the number of iterations in estimation, if needed.

u=zeros(n,m);
emp=zeros(n,m);
x=Burrrnd(alpha,lambda,tau,n,m);
for i=1:m 
    [db,de,vb,ve,w2b,w2e,a2b,a2e,alpha,lambda,tau,alphamin,lambdamin,taumin,likconv]=estBurr(x(:,i),method,numberofiterations);
    if(method==1)
      al=alpha;
      la=lambda;
      ta=tau;
    end
    if(method==2)
      al=alphamin;
      la=lambdamin;
      ta=taumin;
    end
    u(:,i)=sort(Burrcdf(x(:,i),al,la,ta,1));
   emp(:,i)=(1:n)/n;    
end
Dplus=max(emp-u);
Dminus=max(u-emp+1/n);
D=max([Dplus;Dminus]);

V=(Dplus+Dminus);

for i=1:m
    W2(i)=sum((u(:,i)-((1:2:(2*n-1))/(2*n))').^2)+1/(12*n);
end
for i=1:m
    A2(i)=-n-1/n*sum((1:2:(2*n-1))'.*log(u(:,i))+((2*n-1):-2:1)'.*log(1-u(:,i)));
end



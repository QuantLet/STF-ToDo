function [D,V,W2,A2]=cvPareto(n,m,alpha,lambda,method,numberofiterations) 
% CVPARETO  Simulated values of the EDF statistics for the Pareto distribution.
%    [D,V,W2,A2]=CVPARETO(N,M,ALPHA,LAMBDA,METHOD,NUMBERIFITERATIONS) returns 
%    simulated values of the EDF statistics for the Pareto distribution 
%    with given parameters ALPHA, LAMBDA. It uses M simulated samples 
%    of length N and the chosen method of estimation (METHOD=0 - method
%    of moments, METHOD=1 - maximum likelihood, METHOD=2 - A2 statistic 
%    minimalization). NUMBEROFITERATIONS is the number of iterations
%    in estimation, if needed.

u=zeros(n,m);
x=Paretornd(alpha,lambda,n,m);
for i=1:m
    [db,delik,demin,vb,velik,vemin,w2b,w2elik,w2emin,a2b,a2elik,a2emin,alpha,lambda,alphalik,lambdalik,alphamin,lambdamin,caution]=estPareto(x(:,i),method,numberofiterations);
    if(method==1)
      al=alphalik;
      la=lambdalik;
    else 
      if(method==2)
        al=alphamin;
        la=lambdamin;
      else
        al=alpha;
        la=lambda;
      end
    end
    u(:,i)=sort(Paretocdf(x(:,i),al,la,1));
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
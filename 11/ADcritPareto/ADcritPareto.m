function A2 = ADcritPareto(param,x) 
% ADCRITPARETO Anderson-Darling test statistics for the Pareto distribution.
%              A2=ADcritPareto(param,x) returns the value of the Anderson-Darling
%              statistics for the Pareto distribution with given 
%              parameters (param) and data from the analyzed sample (x).


    global     d v w2 a2;

    n      = length(x);
    alpha  = param(1);
    lambda = param(2);
    u      = sort(Paretocdf(x,alpha,lambda,1))';

    emp    = (1:n) / n;
    Dplus  = max(emp-u);
    Dminus = max(u-emp+1/n);
    D      = max([Dplus;Dminus]);

    V      = Dplus+Dminus;

    W2     = sum((u-(1:2:(2*n-1))/(2*n)).^2)+1/(12*n);

    uno0   = u(find(u==0));
    if ~isempty(uno0)
        u(find(u==0))=min(uno0);
    end
    A2 = -n-1/n*sum((1:2:(2*n-1)).*log(u)+((2*n-1):-2:1).*log(1-u));

    d  = [d;D];
    v  = [v;V];
    w2 = [w2;W2];    
    a2 = [a2;A2];

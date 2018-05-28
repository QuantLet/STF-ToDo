[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **STF2logpayoff** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: STF2logpayoff

Published in: Statistical Tools for Finance and Insurance

Description: 'Shows the linear approximation of the log payoff with the portfolio of options of a given number of strikes and given range. The code needs "blsprice" function from MATLAB toolbox.'

Keywords: option, portfolio, discrete, linear, approximation

See also: STF2vswapstrike

Author: Elena Silyakova

Submitted: Mon, December 05 2011 by Dedy Dwi Prastyo

Input: 's2- the highest strike of options" portfolio
	s1- the lowest strike of options" portfolio
	tau- maturity of the swap
	n- number of options used for replication'

Output: '2D plot of a log payoff function'
```

### MATLAB Code
```matlab

clear all
% user input parameters
disp('Please input the lowest and the highest strike of options portfolio as: [10,200]') ;
disp(' ') ;
para=input('Options strike range [lower bound, upper bound]=');
while length(para) < 2
  disp('Not enough input arguments. Please input in 1*2 vector form like [10,200] or [10,200]');
  para=input('Options strike range [lower bound, upper bound]=');
end
s1=para(1);
s2=para(2);

  disp(' ') ;
disp('Please input the number of options to use for replication') ;
disp(' ') ;
para=input('Number of options used for replication =');
n=para;

disp(' ') ;
disp('Please input the maturity of a swap (e.g. 1 year = 1, 3 month = 0.25)') ;
disp(' ') ;
para=input('Maturity of a swap =');
tau=para;

r=0;                        % interest rate
v=0.25;                     % volatility
s=(s2+s1)/2;                % defines the underlying price S
k=s1:((s2-s1)/(n-1)):s2;     % defines the range of strikes

i=1;
while k(i)< s    
put(i) = blsprice(s, k(i), 0.1, 0.25, 0.5);
opt(i)=put(i);
i=i+1 ;   
end
th=i;
for i=i:n    
call(i) = blsprice(s, k(i), 0.1, 0.25, 0.5);
opt(i)=call(i);
end    

x=s1:0.01:s2;

f=log(s./x)+x./s-1;


discr=log(s./k)+k./s-1;


j=th;

w(j)=(discr(j)-1)/(k(j)-s); %weight of fist call (with strike eqial to spot price)

wcum=w(j);

while j < n+1   
    
w(j)=(discr(j)-discr(j-1))/(k(j)-k(j-1))-wcum;

wcum=wcum+w(j);
j=j+1;
end

j=th-1;
wcum=0;

w(j)=(discr(j)-1)/(s-k(j)); %weight of fist put
wcum=w(j);

while j > 0  
    
w(j)=(discr(j)-discr(j+1))/(k(j+1)-k(j))-wcum;

wcum=wcum+w(j);
j=j-1;
end

strike=(sum(w.*opt))^0.5;







% output
plot (x,f);
hold on
plot(k,discr)
title('Linear approximation of a log payoff')
xlabel('S');
ylabel('F(S)');
hold off

clear x wcum w v th tau strike s2 s1 s r put para opt n k j i f discr call ans



```

automatically created on 2018-05-28
% ---------------------------------------------------------------------
% Book:         STF2
% ---------------------------------------------------------------------
% Quantlet:     STF2dollargamma2D
% ---------------------------------------------------------------------
% Description:  STF2dollargamma calculates the variance vega of equally
%               weighted options' portfolio, weighted by 1/K and by 1/K^2
% ---------------------------------------------------------------------
% Usage:        STF2dollargamma2D
% ---------------------------------------------------------------------
% Inputs:       s1 - the lowest strike of options'portfolio
%               s2 - the highest strike of options'portfolio
%               n - number of strikes in portfolio
%               tau - maturity of a swap;
% ---------------------------------------------------------------------
% Output:       2D plot of individual dollar gammas and portfolio dollar
%               gamma for each weighting scheme
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Elena Silyakova
% ---------------------------------------------------------------------
close all
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

disp(' ') ;
disp('Please input the number of strikes in portfolio (e.g. 10)') ;
disp(' ') ;
para=input('Number of strikes =');
n=para;


disp(' ') ;
disp('Please input the maturity of a swap (e.g. 1)') ;
disp(' ') ;
para=input('Maturity =');
tau=para;



% main computation
r=0   ;              % interest rate
v=0.25 ;             % volatility

k=s1:-(s1-s2-1)/n:s2;
range=s2-s1;

for j=1:n %produces gamma "curves" for each strike range    

s_min=max(s1,(k(j)-range));
s_max=min(s2,(k(j)+range));
s=s_min:1:s_max;


for i=1:length(s)  %produces individual gammas for a given strike but different underlying price 
d1=(log(s(i)/k(j))+(r+v^2/2)*tau)/(v*tau^0.5);
dollargamma(i,j)=(normpdf(d1)*s(i))/(2*v*tau^0.5);
dollargammak(i,j)=(normpdf(d1)*s(i))/(2*k(j)*v*tau^0.5);
dollargammak2(i,j)=(normpdf(d1)*s(i))/(2*k(j)^2*v*tau^0.5);

i=i+1;
end

j=j+1;
end

%calculating dollar gamma of the sum
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cumdollargamma=dollargamma(:,1);
for b=2:n-1
cumdollargamma=cumdollargamma+dollargamma(:,b);
end
cumdollargamma=2*max(max(dollargamma))*cumdollargamma/max(cumdollargamma);



cumdollargammak=dollargammak(:,1);
for b=2:n-1
cumdollargammak=cumdollargammak+dollargammak(:,b);
end
cumdollargammak=2*max(max(dollargamma))*cumdollargammak/max(cumdollargammak);


cumdollargammak2=dollargammak2(:,1);
for b=2:n-1
cumdollargammak2=cumdollargammak2+dollargammak2(:,b);
end
cumdollargammak2=2*max(max(dollargamma))*cumdollargammak2/max(cumdollargammak2);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%plotting



subplot(3,1,1);
x = s1:1:s2;

axis([s1 s2 0 max(cumdollargamma)])
%title('Dollargamma of the options portfolio')
xlabel('Underlying price')
ylabel('Dollar gamma')
hold on


for z=1:n
plot(x,dollargamma(:,z), 'color',[0 0 0],'LineWidth',1)
hold on
end
  
plot(x,cumdollargamma, 'color',[0 0 0],'LineWidth',2)


subplot(3,1,2);

x = s1:1:s2;

axis([s1 s2 0 max(cumdollargammak)])
%title('Dollargamma of the options portfolio')
xlabel('Underlying price')
ylabel('Dollar gamma')
hold on


for z=1:n
plot(x,dollargamma(:,z), 'color',[0 0 0],'LineWidth',1)
hold on
end
    
    
plot(x,cumdollargammak, 'color',[0 0 0],'LineWidth',2)




subplot(3,1,3);

x = s1:1:s2;

axis([s1 s2 0 max(cumdollargammak2)])
%title('Dollargamma of the options portfolio')
xlabel('Underlying price')
ylabel('Dollar gamma')
hold on


for z=1:n
plot(x,dollargamma(:,z), 'color',[0 0 0],'LineWidth',1)
hold on
end

plot(x,cumdollargammak2, 'color',[0 0 0],'LineWidth',2)


hold off


clear b cumdollargamma cumdollargammak cumdollargammak2 d1 dollargamma dollargammak dollargammak2 i j k n para r range s s1 s2 s_max s_min tau v x z




%----------------------------------------------------------------------------
% Book:         STF
%----------------------------------------------------------------------------
% See also:     BondZeroCoupon, Burrrnd, mixexprnd, simHPP, simNHPP, Paretornd,
%               simNHPPALP
%----------------------------------------------------------------------------
% Quantlet:     STFcat09
%----------------------------------------------------------------------------
% Description:  STFcat09 plots the difference between zero-coupon CAT bond prices 
%               in the Burr claim amount case for two different non-homogeneous
%               Poisson processes governing the flow of losses.
%----------------------------------------------------------------------------
% Author:       Awdesch Melzer 20130731
%---------------------------------------------------------------------------- 

close all
clear all
clc

parlambda1 = [35.32,2.32*2*pi,-0.2];  % NHPP1
parlambda2 = [35.22,0.224,-0.16];     % NHPP2
distr      = 'Burr';
%distr     = 'lognormal';
%params    = [18.3806,1.1052] %lognormal
params     = [0.4801,3.9495*1e16,2.1524]; %Burr

data       = load('ncl.dat');
A          = mean(data(:,3))*(34.2/4);
AE         = 12*A;
na         = 41; % default 41
D          = A:(12*A-A)/(na-1):AE;
B          = 0.25;
BE         = 8*B;
nb         = 41; % default 41
T          = B:(8*B-B)/(nb-1):BE;
Tmax       = max(T);
lambda1    = 0;
lambda2    = 2;

N          = 1000; % default 1000
r          = log(1.025);
Z          = 1.06;
d1         = BondZeroCoupon(Z,D,T,r,lambda1,parlambda1,distr,params,Tmax,N);
d2         = BondZeroCoupon(Z,D,T,r,lambda2,parlambda2,distr,params,Tmax,N);
y          = d1(:,1);
x          = d1(:,2)/1e9;
z          = d1(:,3)-d2(:,3);

yy        = reshape(y,na,nb);
xx        = reshape(x,na,nb);
zz        = reshape(z,na,nb);

% Plot
mesh(xx,yy,zz)
xlim([min(x),max(x)])
ylim([min(y),max(y)])
zlim([min(z),max(z)])
view(-45,45)
 
set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold');

% print -painters -dpdf -r600 STFcat09.pdf
% print -painters -dpng -r600 STFcat09.png

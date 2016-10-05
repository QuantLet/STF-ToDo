% ---------------------------------------------------------------------
% Book:         STF2
% ---------------------------------------------------------------------
% Quantlet:     STFloss02
% ---------------------------------------------------------------------
% Description:  STFloss02 plots the empirical distribution function (edf)
%               of a 10-element log-normally distributed sample with
%               parameters mu=0.5 and sigma=0.5 and the approximation
%               of the edf by a continuous, piecewise linear function
%               superimposed on the theoretical distribution function.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% See also:     STFloss01
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Plots of the empirical distribution function (edf)
%               of a 10-element log-normally distributed sample with
%               parameters mu=0.5 and sigma=0.5 and the approximation
%               of the edf by a continuous, piecewise linear function
%               superimposed on the theoretical distribution function.               
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Joanna Janczura
% ---------------------------------------------------------------------

% clear variables and close windows
clear all
close all
clc

% Pseudo random numbers
RandStream.setGlobalStream(RandStream('mt19937ar','seed',12));



r=lognrnd(0.5,0.5,10,1);
[y,x] = ecdf(r);
xw = (10:500)./100;
w = logncdf(xw,0.5,0.5);
n = length(x);

stairs(x,y,'k','LineWidth',1.5);
title('Empirical distribution function','FontSize',16,'FontWeight','Bold');
xlabel('x','FontSize',16,'FontWeight','Bold');
ylabel('CDF(x)','FontSize',16,'FontWeight','Bold');
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
set(gca,'Ytick',[0.0:0.2:1],'YTickLabel',{0.0,0.2,0.4,0.6,0.8,1.0},'FontSize',16,'FontWeight','Bold')
box on

% to save the plot in pdf or png please uncomment next 2 lines:
%print -painters -dpdf -r600 STFloss02_01.pdf
%print -painters -dpng -r600 STFloss02_01.png

figure
plot(xw,w,':r','LineWidth',1.5);
hold on
plot(x,y,'k','LineWidth',1.5);
title('Empirical and lognormal distributions','FontSize',16,'FontWeight','Bold');
xlabel('x','FontSize',16,'FontWeight','Bold');
xlim([0,5])
ylabel('CDF(x)','FontSize',16,'FontWeight','Bold');
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold');
set(gca,'Ytick',[0.0:0.2:1],'YTickLabel',{0.0,0.2,0.4,0.6,0.8,1.0},'FontSize',16,'FontWeight','Bold')
box on

% to save the plot in pdf or png please uncomment next 2 lines:
%print -painters -dpdf -r600 STFloss02_02.pdf
%print -painters -dpng -r600 STFloss02_02.png
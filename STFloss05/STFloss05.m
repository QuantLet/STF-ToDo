% ---------------------------------------------------------------------
% Book:         STF2
% ---------------------------------------------------------------------
% Quantlet:     STFloss05
% ---------------------------------------------------------------------
% Description:  STFloss05 plots three sample Pareto pdfs, Par(alpha,
%               lambda), on linear and double-logarithmic scales. The 
%               thick power-law tails of the Pareto distribution
%               (asymptotically linear in the log-log scale) are clearly
%               visible. Requires Paretopdf.m to run the program (see 
%               quantnet).
% ---------------------------------------------------------------------
% Usage:        Paretopdf.m
% ---------------------------------------------------------------------
% See also:     STFloss01, STFloss02, STFloss03, STFloss04, STFloss06,
%               STFloss07, STFloss08, STFloss09, STFloss10, Paretopdf
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Plots of three sample Pareto pdfs, Par(alpha,lambda),
%               on linear and double-logarithmic scales. The thick
%               power-law tails of the Pareto distribution
%               (asymptotically linear in the log-log scale) are clearly
%               visible.             
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Joanna Janczura
% ---------------------------------------------------------------------

clear all
close all
clc

step=5;

x=(1:144*step)/step;
y1=Paretopdf(x,0.5,2);
y2=Paretopdf(x,2,0.5);
y3=Paretopdf(x,2,1);

plot(x,y1,'k','LineWidth',2);
hold on
plot(x,y2,':r','LineWidth',2);
plot(x,y3,'--','LineWidth',2);
xlim([0,5])
xlabel('x','FontSize',16,'FontWeight','Bold');
ylabel('PDF(x)','FontSize',16,'FontWeight','Bold');
title('Pareto densities','FontSize',16,'FontWeight','Bold');
ylim([0 1])
set(gca,'Ytick',[0.0:0.2:1],'YTickLabel',{0.0,0.2,0.4,0.6,0.8,1.0},'FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold');
box on
% to save the plot in pdf or png please uncomment next 2 lines:
%print -painters -dpdf -r600 STFloss05_01.pdf
%print -painters -dpng -r600 STFloss05_01.png

figure
loglog(x,y1,'k','LineWidth',2);
hold on
loglog(x,y2,':r','LineWidth',2);
loglog(x,y3,'--','LineWidth',2);
xlim([0 10e1])
ylim([10e-5 10e-1])

xlabel('x','FontSize',16,'FontWeight','Bold');
ylabel('PDF(x)','FontSize',16,'FontWeight','Bold');
title('Pareto densities','FontSize',16,'FontWeight','Bold');

set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold');
box on

% to save the plot in pdf or png please uncomment next 2 lines:
%print -painters -dpdf -r600 STFloss05_02.pdf
%print -painters -dpng -r600 STFloss05_02.png


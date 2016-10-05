% ---------------------------------------------------------------------
% Book:         STF2
% ---------------------------------------------------------------------
% Quantlet:     STFloss03
% ---------------------------------------------------------------------
% Description:  STFloss03 plots a probability density function (pdf) of
%               a mixture of two exponential distributions with mixing
%               parameter a=0.5 superimposed on the pdfs of the component
%               distributions as well as semi-logarithmic plots. In the
%               semi-logarithmic plot, the exponential pdfs are straight
%               lines with slopes -beta. Note, the curvature of the pdf
%               of the mixture if two exponentials.
%               Requires mixexppdf.m to run the program (see quantnet).
% ---------------------------------------------------------------------
% Usage:        mixexppdf.m
% ---------------------------------------------------------------------
% See also:     STFloss01, STFloss02, STFloss04, STFloss05, STFloss06,
%               STFloss07, STFloss08, STFloss09, STFloss10, mixexppdf
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Plot of a probability density function (pdf) of
%               a mixture of two exponential distributions with mixing
%               parameter a=0.5 superimposed on the pdfs of the component
%               distributions as well as semi-logarithmic plots. In the
%               semi-logarithmic plot, the exponential pdfs are straight
%               lines with slopes -beta. Note, the curvature of the pdf
%               of the mixture if two exponentials.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Joanna Janczura
% ---------------------------------------------------------------------

% clear all variables and close windows
clear all
close all
clc


step = 10;

x=(1:8*step)/step;

y1 = exppdf(x,3);
y2 = exppdf(x,1);
y3 = mixexppdf(x,0.5,0.3,1);


figure(1)
plot(x,y1,'k','LineWidth',2);
hold on
plot(x,y2,':r','LineWidth',2);
plot(x,y3,'--','LineWidth',2);
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold');
box on
xlabel('x','FontSize',16,'FontWeight','Bold');
ylabel('PDF(x)','FontSize',16,'FontWeight','Bold');
title('Mixture of two exponential densities','FontSize',16,'FontWeight','Bold');
set(gca,'Ytick',[0.0:0.2:1],'YTickLabel',{0.0,0.2,0.4,0.6,0.8,1.0},'FontSize',16,'FontWeight','Bold')
ylim([-0.01 0.8]);

% to save the plot in pdf or png please uncomment next 2 lines:
% print -painters -dpdf -r600 STFloss03_01.pdf
% print -painters -dpng -r600 STFloss03_01.png


figure(2)
semilogy(x,y1,'k','LineWidth',2);
hold on
semilogy(x,y2,':r','LineWidth',2);
semilogy(x,y3,'--','LineWidth',2);
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold');
box on
xlabel('x','FontSize',16,'FontWeight','Bold');
ylabel('PDF(x)','FontSize',16,'FontWeight','Bold');
title('Mixture of two exponential semi-log densities','FontSize',16,'FontWeight','Bold');
ylim([10e-3 10e-1]);

% to save the plot in pdf or png please uncomment next 2 lines:
% print -painters -dpdf -r600 STFloss03_02.pdf
% print -painters -dpng -r600 STFloss03_02.png
% ---------------------------------------------------------------------
% Book:         STF2
% ---------------------------------------------------------------------
% Quantlet:     STFstab05
% ---------------------------------------------------------------------
% Description:  STFstab05 plots (log)-returns of DJIA index with
%               GARCH(1,1)-based daily volatility estimate sigma_t 
%               (figure 1, left panel), as well as sigma_t filtered DJIA
%               returns (figure 1, right panel). It also provides left 
%               tail plots of the cdf of (standardized) returns (figure 2,
%               upper left panel), filtered returns (figure 2, upper right
%               panel) with four fitted distributions. The corresponding
%               right tails are plotted in figure 2 bottom left and right
%               panels.
% ---------------------------------------------------------------------
% Usage:        empcdf.m, nigest.m, hypest.m, stabreg.m, edftests.m
%               hypcdf.m, nigcdf.m, stabcdf.m
% ---------------------------------------------------------------------
% See also:     empcdf, nigest, hypest, stabreg, edftests, hypcdf,
%               nigcdf, stabcdf
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Plots of (log)-returns of DJIA index with
%               GARCH(1,1)-based daily volatility estimate sigma_t 
%               (figure 1, left panel), as well as sigma_t filtered DJIA
%               returns (figure 1, right panel). Left tail plots of the cdf
%               of (standardized) returns (figure 2, upper left panel),
%               filtered returns (figure 2, upper right panel)
%               with four fitted distributions. The corresponding
%               right tails are plotted in figure 2 bottom left and right
%               panels.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Rafal Weron
% ---------------------------------------------------------------------


% clear variables and close windows
clear all
close all
clc


cmd = [1 5];

% data load
dane = load('Dane_copula.txt');


if ismember(5,cmd),
    

    %DJIA
    d = dane(:,7);
    d = d(~isnan(d));
    x = log(d(2:end)./d(1:end-1));
    length_DJIA = length(x)
    spec = garchset('P', 1, 'Q', 1, 'Display', 'off');
    [Coeff1,Errors1,LLF1,Innovations1,Sigmas1,Summary1] = garchfit(spec,x);
    xg = x./Sigmas1;
    xr = x/std(x);

    figure(1)
    subplot(1,2,1)
    plot(x)
    hold on
    plot(Sigmas1,'r-','Linewidth',2)
    hold off
    xlabel('Days (2000.01.03-2009.12.31)')
    ylabel('Returns')
    set(gca,'xlim',[0,length(x)+1],'ylim',[-.12 .12])
    legend('Returns','sigma','Location','North')

    subplot(1,2,2)
    plot(xg)
    xlabel('Days (2000.01.03-2009.12.31)')
    ylabel('Returns')
    set(gca,'xlim',[0,length(x)+1],'ylim',[-7 7])
    legend('Filtered DJIA returns')

    figure(2)

    disp('DJIA returns (standartized)')  
    
    [xemp0,yemp0] = empcdf(xr);
    [an0,bn0,dn0,mn0] = nigest(xr);
    [ah0,bh0,dh0,mh0] = hypest(xr);
    [a0,s0,b0,m0] = stabreg(xr);
    xx = linspace(-15,15,1000);
    yg0 = normcdf(xx,mean(xr),std(xr));
    yh0 = hypcdf(xx',ah0,bh0,dh0,mh0);
    yn0 = nigcdf(xx',an0,bn0,dn0,mn0);
    ys0 = stabcdf(xx,a0,s0,b0,m0);
    gauss_param0 = [mean(xr),std(xr)]
    [A2,D] = edftests(xr,gauss_param0,'Gaussian'); [D,A2]
    hyp_param0 = [ah0,bh0,dh0,mh0]
    [A2,D] = edftests(xr,hyp_param0,'hyperbolic'); [D,A2]
    nig_param0 = [an0,bn0,dn0,mn0]
    [A2,D] = edftests(xr,nig_param0,'NIG'); [D,A2]
    stab_param0 = [a0,s0,b0,m0]
    [A2,D] = edftests(xr,stab_param0,'stable'); [D,A2]   
    
    disp('Filtered DJIA returns')  
    [xemp,yemp] = empcdf(xg);
    [an,bn,dn,mn] = nigest(xg);
    [ah,bh,dh,mh] = hypest(xg);
    [a,s,b,m] = stabreg(xg);
    xx = linspace(-15,15,1000);
    yg = normcdf(xx,mean(xg),std(xg));
    yh = hypcdf(xx',ah,bh,dh,mh);
    yn = nigcdf(xx',an,bn,dn,mn);
    ys = stabcdf(xx,a,s,b,m);
    gauss_param = [mean(xg),std(xg)]
    [A2,D] = edftests(xg,gauss_param,'Gaussian'); [D,A2]
    hyp_param = [ah,bh,dh,mh]
    [A2,D] = edftests(xg,hyp_param,'hyperbolic'); [D,A2]
    nig_param = [an,bn,dn,mn]
    [A2,D] = edftests(xg,nig_param,'NIG'); [D,A2]
    stab_param = [a,s,b,m]
    [A2,D] = edftests(xg,stab_param,'stable'); [D,A2]    
    
    % Raw returns
    subplot(2,2,1)
    loglog(-xemp0,yemp0,'k.','markersize',10)
    hold on
    loglog(-xx,yg0,'b-','linewidth',2)
    loglog(-xx,yh0,'-.','color',[0 .5 0],'linewidth',1)
    loglog(-xx,yn0,'r--','linewidth',1)
    loglog(-xx,ys0,'m-','linewidth',.5)
    hold off
    xlabel('-x')
    ylabel('CDF(x)')
    set(gca,'xlim',[3e-1 10],'ylim',[10e-5 5e-1])
    legend('Returns','Gauss','Hyp','NIG','Stable',3)
    
    subplot(2,2,3)
    loglog(xemp0,1-yemp0,'k.','markersize',10)
    hold on
    loglog(xx,1-yg0,'b-','linewidth',2)
    loglog(xx,1-yh0,'-.','color',[0 .5 0],'linewidth',1)
    loglog(xx,1-yn0,'r--','linewidth',1)
    loglog(xx,1-ys0,'m-','linewidth',.5)
    hold off
    xlabel('x')
    ylabel('1-CDF(x)')
    set(gca,'xlim',[3e-1 10],'ylim',[10e-5 5e-1])
    legend('Returns','Gauss','Hyp','NIG','Stable',3)
    
    % Filtered returns
    subplot(2,2,2)
    loglog(-xemp,yemp,'k.','markersize',10)
    hold on
    loglog(-xx,yg,'b-','linewidth',2)
    loglog(-xx,yh,'-.','color',[0 .5 0],'linewidth',1)
    loglog(-xx,yn,'r--','linewidth',1)
    loglog(-xx,ys,'m-','linewidth',.5)
    hold off
    xlabel('-x')
    ylabel('CDF(x)')
    set(gca,'xlim',[3e-1 10],'ylim',[10e-5 5e-1])
    legend('Filt. returns','Gauss','Hyp','NIG','Stable',3)
    
    subplot(2,2,4)
    loglog(xemp,1-yemp,'k.','markersize',10)
    hold on
    loglog(xx,1-yg,'b-','linewidth',2)
    loglog(xx,1-yh,'-.','color',[0 .5 0],'linewidth',1)
    loglog(xx,1-yn,'r--','linewidth',1)
    loglog(xx,1-ys,'m-','linewidth',.5)
    hold off
    xlabel('x')
    ylabel('1-CDF(x)')
    set(gca,'xlim',[3e-1 10],'ylim',[10e-5 5e-1])
    legend('Filt. returns','Gauss','Hyp','NIG','Stable',3)

    print(f,'-dpsc2','STF2stab05a.ps')
    print(f2,'-dpsc2','STF2stab05b.ps')
end
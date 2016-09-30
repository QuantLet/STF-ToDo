% ---------------------------------------------------------------------
% Book:         STF2
% ---------------------------------------------------------------------
% Quantlet:     STFdmm01
% ---------------------------------------------------------------------
% Description:  STFdmm01 calculating minimum spanning tree and presenting
%               results as a set of links for company data set (close.csv).
%               The links are presented in the order of attachments.
%               Requires mst.m to run the program (see 
%               quantnet).
% ---------------------------------------------------------------------
% Usage:        mst.m
% ---------------------------------------------------------------------
% See also:     mst
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       calculating minimum spanning tree and presenting
%               results as a set of links for company data set (close.csv).
%               The links are presented in the order of attachments.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Janusz Miskiewicz
% ---------------------------------------------------------------------
% Contact:      jamis (at) ift.uni.wroc.pl
% ---------------------------------------------------------------------

% clear variables and close windows
clear all
close all
clc


data      = load('close.csv'); % load data
data      = diff(log(data));   % log returns
data      = corr(data);        % correlations of log returns
odl       = sqrt(0.5*(1-data));
mst_odl   = mst(odl);          % minimum span tree

format short;
companies = char('ABB  ','AAPL ','BA   ','KO   ','EMR   ','GE   ','HPQ  ','HIT  ','IBM  ','INTC ','JNJ  ','LMT  ','MSFT ','NOC  ','NVS  ','CL    ','PEP  ','PG    ','TSEM ','WEC  ');
odl       = triu(odl,1);
MST_UD    = [companies(mst_odl(:,1),:),companies(mst_odl(:,2),:),num2str(mst_odl(:,3),4)];
MST_UD
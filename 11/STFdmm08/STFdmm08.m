% ---------------------------------------------------------------------
% Book:         STF2
% ---------------------------------------------------------------------
% Quantlet:     STFdmm08
% ---------------------------------------------------------------------
% Description:  STFdmm08 presents the analysis of the network evolution. 
%               The procedure generate networks in moving time window
%               and calculate the frequency of connections between
%               elements of the chosen S&P 500 companies (close.csv).
%               The unidirectional minimum length path is constructed.
%               Requires ultra.m, umlp.m to run the program (see 
%               quantnet).
% ---------------------------------------------------------------------
% Usage:        ultra.m, umlp.m
% ---------------------------------------------------------------------
% See also:     ultra, umlp
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       The unidirectional minimum length path is constructed.
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


data    = load('close.csv'); % load data
data    = diff(log(data)); % log return
[dl_szer,podmioty] = size(data);
czes    = zeros(podmioty);
window  = 100; %time window size

% moving time window
  wynik = zeros(dl_szer - window-1,5);
  
for t=1:(dl_szer - window-1)
    window_data = data(t:(t+window-1),:);
    wind_dist   = ultra(window_data);
    wind_umlp   = umlp(wind_dist,5);
  for i=1:podmioty-1
        if (wind_umlp(i,1)<wind_umlp(i,2))
            czes(wind_umlp(i,1),wind_umlp(i,2))=czes(wind_umlp(i,1),wind_umlp(i,2))+1;
        else
            czes(wind_umlp(i,2),wind_umlp(i,1))=czes(wind_umlp(i,2),wind_umlp(i,1))+1;
        end;
  end;
    wind_umlp   = [];
    wind_dist   = [];
    window_data = [];
end;


companies       = ['   ','ABB  ','AAPL ','BA   ','KO   ','EMR   ','GE   ','HPQ  ','HIT  ','IBM  ','INTC ','JNJ  ','LMT  ','MSFT ','NOC  ','NVS  ','CL    ','PEP  ','PG    ','TSEM ','WEC  '];
companies1      = char('ABB  ','AAPL ','BA   ','KO   ','EMR   ','GE   ','HPQ  ','HIT  ','IBM  ','INTC ','JNJ  ','LMT  ','MSFT ','NOC  ','NVS  ','CL    ','PEP  ','PG    ','TSEM ','WEC  ');
freq            = round(100000*czes/sum(sum(czes)))/1000;

freqTEMP        = [companies1(1:20,:),num2str(freq(:,:))];

disp('      ABB        AAPL        BA           KO          EMR         GE      HPQ         HIT         IBM         INTC        JNJ         LMT         MSFT        NOC         NVS             CL          PEP         PG      TSEM        WEC')
disp(freqTEMP)


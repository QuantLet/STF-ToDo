% ---------------------------------------------------------------------
% Book:         STF2
% ---------------------------------------------------------------------
% Quantlet:     STFdmm07
% ---------------------------------------------------------------------
% Description:  STFdmm07 presents the analysis of the network evolution. 
%               The procedure generate networks in moving time window
%               and calculate the frequency of connections between
%               elements of the chosen WIG 20 companies (gwp.csv).
%               The minimum spanning tree is constructed.
%               Requires ultra.m, mst.m to run the program (see 
%               quantnet).
% ---------------------------------------------------------------------
% Usage:        ultra.m, mst.m
% ---------------------------------------------------------------------
% See also:     ultra, mst
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       The minimum spanning tree is constructed.
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


data    = load('gwp.csv'); % load data
data    = diff(log(data)); % log return
[dl_szer,podmioty] = size(data);
czes    = zeros(podmioty);
window  = 100; %time window size

% moving time window
  wynik = zeros(dl_szer - window-1,5);
  
for t=1:(dl_szer - window-1)
    window_data = data(t:(t+window-1),:);
    wind_dist   = ultra(window_data);
    wind_mst    = mst(wind_dist);
  for i=1:podmioty-1
        if (wind_mst(i,1)<wind_mst(i,2))
            czes(wind_mst(i,1),wind_mst(i,2))=czes(wind_mst(i,1),wind_mst(i,2))+1;
        else
            czes(wind_mst(i,2),wind_mst(i,1))=czes(wind_mst(i,2),wind_mst(i,1))+1;
        end;
  end;
    wind_mst    = [];
    wind_dist   = [];
    window_data = [];
end;

companies   = ['   ','WIG20 ','ACP ','BIO ','BRE ','BZW  ','CEZ ','CPS ','GTN ','GTC ','KGH ','LTS ','PBG ','PEO ','PKN ','PKO ','PXM ','TPS ','TVN '];
companies1  = char('WIG20 ','ACP ','BIO ','BRE ','BZW  ','CEZ ','CPS ','GTN ','GTC ','KGH ','LTS ','PBG ','PEO ','PKN ','PKO ','PXM ','TPS ','TVN ');
freq        = round(100000*czes/sum(sum(czes)))/1000;

freqTEMP    = [companies1(1:18,:),num2str(freq(:,:))];

disp('   WIG20      ACP         BIO         BRE         BZW         CEZ         CPS         GTN         GTC         KGH         LTS         PBG         PEO         PKN         PKO         PXM         TPS         TVN ')
disp(freqTEMP)


% ---------------------------------------------------------------------
% Book:         STF2
% ---------------------------------------------------------------------
% Quantlet:     STFdmm15
% ---------------------------------------------------------------------
% Description:  STFdmm15 presents the rate (in percent) of connections
%               between companies in the case of TD, subset of WIG 20,
%               MST; only nonzero values are presented
%               The Theil index based distance is used.
%               Requires theil.m, mst.m, manh.m to run the program (see 
%               quantnet).
% ---------------------------------------------------------------------
% Usage:        theil.m, mst.m, manh.m
% ---------------------------------------------------------------------
% See also:     theil, mst, manh
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       -
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Janusz Miskiewicz
% ---------------------------------------------------------------------
% Contact:      jamis (at) ift.uni.wroc.pl
% ---------------------------------------------------------------------

clear all
close all
clc

dataWIG     = load('gwp.csv');

dataWIG     = abs(diff(log(dataWIG))); % abs log return
[dl_szer,podmioty]  = size(dataWIG);

dataWIG(dataWIG==0) = 0.0000001;
window1     = 50;
window2     = 50;
theil_data  = theil(dataWIG,window1);

wynikSP     = zeros(dl_szer - window1-1-window2,4);
czes        = zeros(podmioty);
for t=1:(dl_szer - window1-1-window2)
    window_data     = theil_data(t:(t+window2),:);
    wind_dist       = manh(window_data);
    wind_mst        = mst(wind_dist);
    for i=1:podmioty-1
        if (wind_mst(i,1)<wind_mst(i,2))
            czes(wind_mst(i,1),wind_mst(i,2)) = czes(wind_mst(i,1),wind_mst(i,2))+1;
        else
            czes(wind_mst(i,2),wind_mst(i,1)) = czes(wind_mst(i,2),wind_mst(i,1))+1;
        end;
    end;
    wind_mst    = [];
    wind_dist   = [];
end;
freq        = round(100000*czes/sum(sum(czes)))/1000;
companies   = ['   ','WIG20 ','ACP ','BIO ','BRE ','BZW  ','CEZ ','CPS ','GTN ','GTC ','KGH ','LTS ','PBG ','PEO ','PKN ','PKO ','PXM ','TPS ','TVN '];
companies1  = char('WIG20 ','ACP ','BIO ','BRE ','BZW  ','CEZ ','CPS ','GTN ','GTC ','KGH ','LTS ','PBG ','PEO ','PKN ','PKO ','PXM ','TPS ','TVN ');

freqTEMP    = [companies1(1:18,:),num2str(freq(:,:))];

disp('   WIG20      ACP         BIO         BRE         BZW         CEZ         CPS         GTN         GTC         KGH         LTS         PBG         PEO         PKN         PKO         PXM         TPS         TVN ')
disp(freqTEMP)
  

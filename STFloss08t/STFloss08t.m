% -------------------------------------------------------------------------
% Book:         STF2
% -------------------------------------------------------------------------
% Quantlet:     STFloss08t
% -------------------------------------------------------------------------
% Description:  STFloss08 provides parameter estimates obtained via the
%               A-squared minimization scheme and test statistics for the
%               fire loss amounts. The corresponding p-values based on
%               1000 simulated samples.
%               Requires estBurr.m, estln.m, estPareto.m, cvln.m, cvPareto.m,
%               cvBurr.m, ADcritBurr.m, ADcritPareto.m, ADcritln.m, Burrcdf.m,
%               Paretocdf.m, Burrrnd.m, Paretornd.m from the Quantnet website.
% -------------------------------------------------------------------------
% Usage:        estBurr.m, estln.m, estPareto.m, cvln.m, cvPareto.m,
%               cvBurr.m, ADcritBurr.m, ADcritPareto.m, ADcritln.m, Burrcdf.m,
%               Paretocdf.m, Burrrnd.m, Paretornd.m
% -------------------------------------------------------------------------
% See also:     STFloss01, STFloss02, STFloss03, STFloss04, STFloss05,
%               STFloss06, STFloss06, STFloss07, STFloss08, STFloss09,
%               STFloss10, estBurr, estln, estPareto, cvln, cvPareto,
%               cvBurr, ADcritBurr, ADcritPareto, ADcritln, Burrcdf,
%               Paretocdf, Burrrnd, Paretornd
% -------------------------------------------------------------------------
% Inputs:       none
% -------------------------------------------------------------------------
% Output:       Calibration of log-normal, Pareto, and Burr distributions
%               using the A2 minimization scheme for the fire loss amounts of 
%               Danish fire loss data (dfl.dat). The corresponding p-values
%               based on 1000 simulated samples.              
% -------------------------------------------------------------------------
% Example:      For choice=1 tests are provided without simulated data.
%               For choice=2 tests are provided with simulated data.
%         Choose: 1-without simulated p-values, 2-with simulated p-values 
%               1 - Results:
% 
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% Distributions:   log-normal      Pareto                 Burr           
% -------------------------------------------------------------------------
% Parameters:  mu = 1.2525e+01  alpha = 1.3127e+00   alpha = 9.8444e-01    
%           sigma = 1.5384e+00  lambda = 4.0588e+05  lambda = 1.0585e+06    
%                                                      tau = 1.1096e+00      
% -------------------------------------------------------------------------
% Tests:         D = 0.0180           D = 0.0262          D = 0.0266      
%
%         Choose: 1-without simulated p-values, 2-with simulated p-values 
%               2 - Results: 
%
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% Distributions:   log-normal       Pareto                Burr           
% -------------------------------------------------------------------------
% Parameters:  mu = 1.2525e+01  alpha = 1.3127e+00    alpha = 9.8444e-01    
%           sigma = 1.5384e+00  lambda = 4.0588e+05  lambda = 1.0585e+06    
%                                                       tau = 1.1096e+00      
% -------------------------------------------------------------------------
% Tests:           D = 0.0180       D = 0.0262           D = 0.0266      
%                  (<0.005)         (<0.005)             (<0.005)
%                  V = 0.0326       V = 0.0516           V = 0.0496      
%                  (<0.005)         (<0.005)             (<0.005)
%                 W2 = 0.0932       W2 = 0.2322          W2 = 0.2316      
%                  (<0.005)         (<0.005)             (<0.005)
%                 A2 = 0.9851       A2 = 2.6748          A2 = 1.8894      
%                  (<0.005)         (<0.005)             (<0.005)
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
%
% -------------------------------------------------------------------------
% Author:       Joanna Janczura
% -------------------------------------------------------------------------


  choice=input('Choose:n 1-without simulated p-values, 2-with simulated p-values n');
  data=load('dfl.dat','-ascii') ;
  data=data(find(data(:,5)>0),5);
  numberofrepetitions=10;
  significancelevel=0.005;
  
[dbB,deB,vbB,veB,w2bB,w2eB,a2bB,a2eB,alphaB,lambdaB,tauB,alphaminB,lambdaminB,tauminB,likconvB]=estBurr(data,2,3000);
  [dbL,delikL,deminL,vbL,velikL,veminL,w2bL,w2elikL,w2eminL,a2bL,a2elikL,a2eminL,mu,sigma,mulik,sigmalik,mumin,sigmamin,cautionL]=estln(data,2,1000);
  [dbP,delikP,deminP,vbP,velikP,veminP,w2bP,w2elikP,w2eminP,a2bP,a2elikP,a2eminP,alphaP,lambdaP,alphalikP,lambdalikP,alphaminP,lambdaminP,cautionP]=estPareto(data,2,1000);
  set(0,'DefaultTextInterpreter','Latex')
  
  table=['-------------------------------------------------------------------------------------------';
         '-------------------------------------------------------------------------------------------';
         'Distributions:   log-normal                 Pareto                          Burr           ';
         '-------------------------------------------------------------------------------------------';
         'Parameters:    mu = ' sprintf('%4.4e',mumin)    '       alpha = ' sprintf('%4.4e',alphaminP)  '           alpha = ' sprintf('%4.4e',alphaminB)  ' ';
         '            sigma = ' sprintf('%4.4e',sigmamin) '      lambda = ' sprintf('%4.4e',lambdaminP) '          lambda = ' sprintf('%4.4e',lambdaminB) ' ';
         '                                                                    tau = ' sprintf('%4.4e',tauminB)  '     ';
         '-------------------------------------------------------------------------------------------';
         'Tests:           D = ' sprintf('%4.4f',deminL) '                 D = ' sprintf('%4.4f',deminP) '                     D = ' sprintf('%4.4f',deB) '      ';
         '                 V = ' sprintf('%4.4f',veminL) '                 V = ' sprintf('%4.4f',veminP) '                     V = ' sprintf('%4.4f',veB) '      ';
         '                W2 = ' sprintf('%4.4f',w2eminL) '                W2 = ' sprintf('%4.4f',w2eminP) '                    W2 = ' sprintf('%4.4f',w2eB) '      ';
         '                A2 = ' sprintf('%4.4f',a2eminL) '                A2 = ' sprintf('%4.4f',a2eminP) '                    A2 = ' sprintf('%4.4f',a2eB) '      ';
         '-------------------------------------------------------------------------------------------';
         '-------------------------------------------------------------------------------------------'];
  
     disp(table(1:9,:));
     if(choice==2)
      
     [D,V,W2,A2]=cvln(length(data),numberofrepetitions,mumin,sigmamin,2,1000);

     if(sum(D>deminL)/numberofrepetitions>=significancelevel)
       table10=['                 (' sprintf('%4.3f',sum(D>deminL)/numberofrepetitions) ')'];
     else
       table10=['                 (<' sprintf('%4.3f',significancelevel) ')'];
     end
     if(sum(V>veminL)/numberofrepetitions>=significancelevel)
       table12=['                 (' sprintf('%4.3f',sum(V>veminL)/numberofrepetitions) ')'];
     else
       table12=['                 (<' sprintf('%4.3f',significancelevel) ')'];
     end
     if(sum(W2>w2eminL)/numberofrepetitions>=significancelevel)
       table14=['                 (' sprintf('%4.3f',sum(W2>w2eminL)/numberofrepetitions) ')'];
     else
       table14=['                 (<' sprintf('%4.3f',significancelevel) ')'];
     end
     if(sum(A2>a2eminL)/numberofrepetitions>=significancelevel)
       table16=['                 (' sprintf('%4.3f',sum(A2>a2eminL)/numberofrepetitions) ')'];
     else
       table16=['                 (<' sprintf('%4.3f',significancelevel) ')'];     
     end
 
     [D,V,W2,A2]=cvPareto(length(data),numberofrepetitions,alphaminP,lambdaminP,2,1000);
     
     if(sum(D>deminP)/numberofrepetitions>=significancelevel)
       table10=[table10,'              (' sprintf('%4.3f',sum(D>deminP)/numberofrepetitions) ')'];
     else
       table10=[table10,'             (<' sprintf('%4.3f',significancelevel) ')'];
     end
     if(sum(V>veminP)/numberofrepetitions>=significancelevel)
      table12=[table12,'              (' sprintf('%4.3f',sum(V>veminP)/numberofrepetitions) ')'];
     else
      table12=[table12,'             (<' sprintf('%4.3f',significancelevel) ')'];
     end
     if(sum(W2>w2eminP)/numberofrepetitions>=significancelevel)
      table14=[table14,'              (' sprintf('%4.3f',sum(W2>w2eminP)/numberofrepetitions) ')'];
     else
      table14=[table14,'             (<' sprintf('%4.3f',significancelevel) ')'];
     end
     if(sum(A2>a2eminP)/numberofrepetitions>=significancelevel)
      table16=[table16,'              (' sprintf('%4.3f',sum(A2>a2eminP)/numberofrepetitions) ')'];
     else
      table16=[table16,'             (<' sprintf('%4.3f',significancelevel) ')'];
     end
     
     [D,V,W2,A2]=cvBurr(length(data),numberofrepetitions,alphaminB,lambdaminB,tauminB,2,3000);
     
     if(sum(D>deB)/numberofrepetitions>=significancelevel)
       table10=[table10,'              (' sprintf('%4.3f',sum(D>deB)/numberofrepetitions) ')'];
     else
       table10=[table10,'             (<' sprintf('%4.3f',significancelevel) ')'];
     end
     if(sum(V>veB)/numberofrepetitions>=significancelevel)
      table12=[table12,'              (' sprintf('%4.3f',sum(V>veB)/numberofrepetitions) ')'];
     else
      table12=[table12,'             (<' sprintf('%4.3f',significancelevel) ')'];
     end
     if(sum(W2>w2eB)/numberofrepetitions>=significancelevel)
      table14=[table14,'              (' sprintf('%4.3f',sum(W2>w2eB)/numberofrepetitions) ')'];
     else
      table14=[table14,'             (<' sprintf('%4.3f',significancelevel) ')'];
     end
     if(sum(A2>a2eB)/numberofrepetitions>=significancelevel)
      table16=[table16,'              (' sprintf('%4.3f',sum(A2>a2eB)/numberofrepetitions) ')'];
     else
      table16=[table16,'             (<' sprintf('%4.3f',significancelevel) ')'];
     end
   disp(table10);
   disp(table(10,:));
   disp(table12);
   disp(table(11,:));
   disp(table14);
   disp(table(12,:));
   disp(table16);
   disp(table(13:14,:));
  end
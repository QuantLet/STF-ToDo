*This macro used macro %mc_culloch for initial estimates of the parameters; 
%include "d:proiectecartemc_culloch.sas";*Change the path!!!;
 
data f;
input na nb a b;
cards;
2.439	0	2	0
2.439	0.1	2	2.16
2.439	0.2	2	1
2.439	0.3	2	1
2.439	0.5	2	1
2.439	0.7	2	1
2.439	1	2	1
2.5	0	1.916	0
2.5	0.1	1.924	1.592
2.5	0.2	1.924	3.39
2.5	0.3	1.924	1
2.5	0.5	1.924	1
2.5	0.7	1.924	1
2.5	1	1.924	1
2.6	0	1.808	0
2.6	0.1	1.813	0.759
2.6	0.2	1.829	1.8
2.6	0.3	1.829	1
2.6	0.5	1.829	1
2.6	0.7	1.829	1
2.6	1	1.829	1
2.7	0	1.729	0
2.7	0.1	1.73	0.482
2.7	0.2	1.737	1.048
2.7	0.3	1.745	1.694
2.7	0.5	1.745	1
2.7	0.7	1.745	1
2.7	1	1.745	1
2.8	0	1.664	0
2.8	0.1	1.663	0.36
2.8	0.2	1.663	0.76
2.8	0.3	1.668	1.232
2.8	0.5	1.676	2.229
2.8	0.7	1.676	1
2.8	1	1.676	1
3	0	1.563	0
3	0.1	1.56	0.253
3	0.2	1.553	0.518
3	0.3	1.548	0.823
3	0.5	1.547	1.575
3	0.7	1.547	1
3	1	1.547	1
3.2	0	1.484	0
3.2	0.1	1.48	0.203
3.2	0.2	1.471	0.41
3.2	0.3	1.46	0.632
3.2	0.5	1.448	1.244
3.2	0.7	1.438	1.906
3.2	1	1.438	1
3.5	0	1.391	0
3.5	0.1	1.386	0.165
3.5	0.2	1.378	0.332
3.5	0.3	1.364	0.499
3.5	0.5	1.337	0.943
3.5	0.7	1.318	1.56
3.5	1	1.318	1
4	0	1.279	0
4	0.1	1.273	0.136
4	0.2	1.266	0.271
4	0.3	1.25	0.404
4	0.5	1.21	0.689
4	0.7	1.184	1.23
4	1	1.15	2.195
5	0	1.128	0
5	0.1	1.121	0.109
5	0.2	1.114	0.216
5	0.3	1.101	0.323
5	0.5	1.067	0.539
5	0.7	1.027	0.827
5	1	0.973	1.917
6	0	1.029	0
6	0.1	1.021	0.096
6	0.2	1.014	0.19
6	0.3	1.004	0.284
6	0.5	0.974	0.472
6	0.7	0.935	0.693
6	1	0.874	1.759
8	0	0.896	0
8	0.1	0.892	0.082
8	0.2	0.887	0.163
8	0.3	0.883	0.243
8	0.5	0.855	0.412
8	0.7	0.823	0.601
8	1	0.769	1.596
10	0	0.818	0
10	0.1	0.812	0.074
10	0.2	0.806	0.174
10	0.3	0.801	0.22
10	0.5	0.78	0.377
10	0.7	0.756	0.546
10	1	0.691	1.482
15	0	0.698	0
15	0.1	0.695	0.064
15	0.2	0.692	0.128
15	0.3	0.689	0.191
15	0.5	0.676	0.33
15	0.7	0.656	0.478
15	1	0.595	1.362
25	0	0.593	0
25	0.1	0.59	0.056
25	0.2	0.588	0.112
25	0.3	0.586	0.167
25	0.5	0.579	0.285
25	0.7	0.563	0.428
25	1	0.513	1.274
;
run;
 
 
data g;
input a b g d ;
cards;
0.5	0	2.588	0
0.5	0.25	3.073	-0.061
0.5	0.5	4.534	-0.279
0.5	0.75	6.636	-0.659
0.5	1	9.144	-1.198
0.6	0	2.337	0
0.6	0.25	2.635	-0.078
0.6	0.5	3.542	-0.272
0.6	0.75	4.808	-0.581
0.6	1	6.247	-0.997
0.7	0	2.189	0
0.7	0.25	2.392	-0.089
0.7	0.5	3.004	-0.262
0.7	0.75	3.844	-0.52
0.7	1	4.775	-0.853
0.8	0	2.098	0
0.8	0.25	2.244	-0.096
0.8	0.5	2.676	-0.25
0.8	0.75	3.265	-0.469
0.8	1	3.912	-0.742
0.9	0	2.04	-0.099
0.9	0.25	2.149	-0.237
0.9	0.5	2.461	-0.424
0.9	0.75	2.886	-0.652
0.9	1	3.356	1
1	0	2	0
1	0.25	2.085	-0.098
1	0.5	2.311	-0.223
1	0.75	2.624	-0.383
1	1	2.973	-0.576
1.1	0	1.98	0
1.1	0.25	2.04	-0.095
1.1	0.5	2.205	-0.208
1.1	0.75	2.435	-0.346
1.1	1	2.696	-0.508
1.2	0	1.965	0
1.2	0.25	2.007	-0.09
1.2	0.5	2.125	-0.192
1.2	0.75	2.294	-0.31
1.2	1	2.491	-0.447
1.3	0	1.955	0
1.3	0.25	1.984	-0.084
1.3	0.5	2.067	-0.173
1.3	0.75	2.188	-0.276
1.3	1	2.333	-0.39
1.4	0	1.946	0
1.4	0.25	1.967	-0.075
1.4	0.5	2.022	-0.154
1.4	0.75	2.106	-0.241
1.4	1	2.211	-0.335
1.5	0	1.939	0
1.5	0.25	1.952	-0.066
1.5	0.5	1.988	-0.134
1.5	0.75	2.045	-0.206
1.5	1	2.116	-0.283
1.6	0	1.933	0
1.6	0.25	1.94	-0.056
1.6	0.5	1.962	-0.111
1.6	0.75	1.997	-0.17
1.6	1	2.043	-0.232
1.7	0	1.927	0
1.7	0.25	1.93	-0.043
1.7	0.5	1.943	-0.088
1.7	0.75	1.961	-0.132
1.7	1	1.987	-0.179
1.8	0	1.921	0
1.8	0.25	1.922	-0.03
1.8	0.5	1.927	-0.061
1.8	0.75	1.936	-0.092
1.8	1	1.947	-0.123
1.9	0	1.914	0
1.9	0.25	1.915	-0.017
1.9	0.5	1.916	-0.032
1.9	0.75	1.918	-0.049
1.9	1	1.921	-0.064
2	0	1.908	0
2	0.25	1.908	0
2	0.5	1.908	0
2	0.75	1.908	0
2	1	1.908	0
;
run;
 
 
 
%macro stab_reg_kw( data=, var=, error=, maxiter=);
%mc_culloch(data=&data, var=&var);
 
data _null_;
set parms;
call symput('delta0', delta);
call symput('gamma0', gamma);
call symput('alpha0', alpha);
call symput('beta0', beta);
run;
 
proc iml;
delta0=&delta0;
alpha0=&alpha0;
beta0=&beta0;
gamma0=&gamma0;
niter=1;
maxerror=1;
do until ((maxerror<&error) | niter=&maxiter);
 
if niter>0 then do;
 
 use &data; 
 READ all var {&var} into x;                                                                                                     
n=nrow(x);
x1=j(n,1,0);
re=j(10,1,0);
im=j(10,1,0);
w=j(10,1,0);
y=j(10,1,0);
z=j(10,1,0);
v=j(10,1,0);
q=j(10,1,0);
pi=constant('pi');
 
x1=(x-delta0)/gamma0;
do k=1 to 10;
u=0.1+0.1*(k-1);
rep=cos(u*x1);
imp=sin(u*x1);
w[k,1]=log(abs(u));
re[k,1]=mean(rep);
im[k,1]=mean(imp);
y[k,1]=log(-0.5*log(re[k,1]**2+im[k,1]**2));
end;
 
 
x0t=j(1,10,1);
/* x0t is a row vector of ones */
x=(x0t//w`)`; /* xt is the transposed design matrix for a simple linear
regression */
b=inv(x`*x)*x`*y; /* beta is a vector of estimated regression coefficients*/
alpha1=b[2,1];
gamma1=exp(b[1,1]/b[2,1]);
 
do k=1 to 10;
u=0.1+0.1*(k-1);
z[k,1]=atan(im[k,1]/re[k,1]);
v[k,1]=gamma1*u*(abs(gamma1*u)**(alpha1-1)-1)*tan(pi*alpha1/2);
q[k,1]=u;
end;
 
x=(v`//q`)`; /* xt is the transposed design matrix for a simple linear
regression */
c=inv(x`*x)*x`*z; /* beta is a vector of estimated regression coefficients*/
beta1=c[1,1];
 
 
gamma=gamma0*gamma1;
delta1=delta0+gamma0*c[2,1]; 
error=j(4,1,0);
error[1,1]=abs(alpha1-alpha0);
error[2,1]=abs(beta1-beta0);
error[3,1]=abs(gamma1-gamma0);
error[4,1]=abs(delta1-delta0);
maxerror=sum(error**2);
end;
alpha0=alpha1;
beta0=beta1;
gamma0=gamma1;
delta0=delta1;
niter=niter+1;
end;
if alpha0 <= 0 then alpha0=10**(-10);
if alpha0>2 then alpha0=2;
if gamma0 <= 0 then gamma0=10**(-10);
if beta0>1 then beta0=1;
if beta0<-1 then beta0=-1;
	res=j(1,4,0);
	delta0 = delta0 - beta0*gamma0*tan(0.5*pi*alpha0); 
 
	res[1,1]=alpha0;
	res[1,2]=beta0;
	res[1,3]=gamma0;
	res[1,4]=delta0;
 
	create res from res;append from res;
 
 
quit;
data res;set res;
rename col1=alpha;
rename col2=beta;
rename col3=gamma;
rename col4=delta;
run;
%mend;
 
*EXAMPLE;
 
*Use %sim_stable to generate the random variable y 
	under parameterisation S1 with alpha=1.5,beta=0,delta=0,gamma=1;
 
%include "d:proiectecartesim_stable.sas"; *change the path!!!!;
*A simulated stable distribution y with the parameters 
alpha=1.5,beta=0,delta=0,gamma=1 and 1000 obervations 
is created in the dataset date;
%sim_stable(alpha=1.5,beta=0,delta=0,gamma=1,n=1000) ;
 
*Use %stab_reg_kw to estimate the parameters;
%stab_reg_kw( data=date, var=y, error=0.01, maxiter=100);
 
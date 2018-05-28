[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **mc_culloch** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: mc_culloch

Published in: Statistical Tools for Finance and Insurance

Description: 'Estimates the parameters of an alpha-stable distribution using quantile method (so called McCulloch method).'

Keywords: McCulloch, estimation, quantile, stable, stable distribution

See also: fractal_hurst, sim_stable, stab_reg_kw, stabcull

Author: Daniel T. Pele

Submitted: Sat, March 15 2014 by Lukas Borke

Input: 'data: Dataset
        var:  variable used for estimation'

Output: 'parms: SAS dataset containing the estimates
         delta: location parameter
         alpha: stability index
         beta:  skewness parameter
         gamma: scale parameter'

Example: 'An example is generated for a simulated stable distribution S(alpha=1.5,beta=0,delta=0,gamma=1).'

```

### SAS Code
```sas

*SAS datasets f and g contains the tabulated values of the theoretical
functions - see http://www.econ.ohio-state.edu/jhm/papers/stabparm.pdf;
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

*SAS macro mc_culloch estimates parameters of stable-distribution for
variable var, from dataset data;
%macro mc_culloch(data=,var=);

proc iml;
 use &data; 
READ all var {&var} into x;                                                                                                     
p = {0.05, 0.25, 0.50, 0.75, 0.95}; 
call qntl(q, x, p); /* compute 5th, 25th, 50th, 75th and 95th quantiles */;

 use f; 
READ all var {na nb a b} into f; 
 use g; 
READ all var {a b g d} into g;                                                                                                     
 n=nrow(g);

m=nrow(f);
na=(q[5]-q[1])/(q[4]-q[2]);
nb=(q[5]+q[1]-2*q[3])/(q[5]-q[1]);
pi=constant('pi');
*estimate alpha;
do i=1 to m-1 while(na>=2.439);
j=i+1;
if (f[i,1]<=na & na<f[j,1]) then 
x1=f[i,1] ;
if (f[i,1]<=na & na<f[j,1]) then 
x2=f[j,1] ;

if (f[i,2]<=abs(nb) & abs(nb)<f[j,2]) then 
y1=f[i,2] ;
if (f[i,2]<=abs(nb) & abs(nb)<f[j,2]) then 
y2=f[j,2] ;
end;
do i=1 to m;

if (f[i,1]=x1 & f[i,2]=y1) then 
q11=f[i,3] ;
if (f[i,1]=x1 & f[i,2]=y2) then 
q12=f[i,3] ;
if (f[i,1]=x2 & f[i,2]=y1) then 
q21=f[i,3] ;
if (f[i,1]=x2 & f[i,2]=y2) then 
q22=f[i,3] ;
end;


	if na<2.439 then alpha=2 ;
	else
	alpha=(q11*(x2-na)*(y2-abs(nb))+
	q21*(na-x1)*(y2-abs(nb))+q12*(x2-na)*(abs(nb)-y1)+
	q22*(na-x1)*(abs(nb)-y1))/((x2-x1)*(y2-y1));

*estimate beta;
	
do i=1 to m-1 ;
	j=i+1;
	if (f[i,1]<=na & na<f[j,1]) then 
	x1=f[i,1] ;
	if (f[i,1]<=na & na<f[j,1]) then 
	x2=f[j,1] ;

	if (f[i,2]<=abs(nb) & abs(nb)<f[j,2]) then 
	y1=f[i,2] ;
	if (f[i,2]<=abs(nb) & abs(nb)<f[j,2]) then 
	y2=f[j,2] ;
end;
do i=1 to m;

	if (f[i,1]=x1 & f[i,2]=y1) then 
	q11=f[i,4] ;
	if (f[i,1]=x1 & f[i,2]=y2) then 
	q12=f[i,4] ;
	if (f[i,1]=x2 & f[i,2]=y1) then 
	q21=f[i,4] ;
	if (f[i,1]=x2 & f[i,2]=y2) then 
	q22=f[i,4] ;
end;


	beta=sign(nb)*(q11*(x2-na)*(y2-abs(nb))+
	q21*(na-x1)*(y2-abs(nb))+q12*(x2-na)*(abs(nb)-y1)+
	q22*(na-x1)*(abs(nb)-y1))/((x2-x1)*(y2-y1));

if abs(beta)>1 then beta=sign(nb)*1;

	*estimate gamma;
do i=1 to n-1;
j=i+1;
if (g[i,1]<=alpha & alpha<g[j,1]) then 
x1=g[i,1] ;
if (g[i,1]<=alpha & alpha<g[j,1]) then 
x2=g[j,1] ;

if (g[i,2]<=abs(beta) & abs(beta)<g[j,2]) then 
y1=g[i,2] ;
if (g[i,2]<=abs(beta) & abs(beta)<g[j,2]) then 
y2=g[j,2] ;
end;
do i=1 to n;

if (g[i,1]=x1 & g[i,2]=y1) then 
q11=g[i,3] ;
if (g[i,1]=x1 & g[i,2]=y2) then 
q12=g[i,3] ;
if (g[i,1]=x2 & g[i,2]=y1) then 
q21=g[i,3] ;
if (g[i,1]=x2 & g[i,2]=y2) then 
q22=g[i,3] ;
end;


	f3=(q11*(x2-alpha)*(y2-abs(beta))+
	q21*(alpha-x1)*(y2-abs(beta))+q12*(x2-alpha)*(abs(beta)-y1)+
	q22*(alpha-x1)*(abs(beta)-y1))/((x2-x1)*(y2-y1));
	gamma=(q[4]-q[2])/f3;

	*estimate delta;
do i=1 to n-1;
j=i+1;
if (g[i,1]<=alpha & alpha<g[j,1]) then 
x1=g[i,1] ;
if (g[i,1]<=alpha & alpha<g[j,1]) then 
x2=g[j,1] ;

if (g[i,2]<=abs(beta) & abs(beta)<g[j,2]) then 
y1=g[i,2] ;
if (g[i,2]<=abs(beta) & abs(beta)<g[j,2]) then 
y2=g[j,2] ;
end;
do i=1 to n;

if (g[i,1]=x1 & g[i,2]=y1) then 
q11=g[i,4] ;
if (g[i,1]=x1 & g[i,2]=y2) then 
q12=g[i,4] ;
if (g[i,1]=x2 & g[i,2]=y1) then 
q21=g[i,4] ;
if (g[i,1]=x2 & g[i,2]=y2) then 
q22=g[i,4] ;
end;


	f4=(q11*(x2-alpha)*(y2-abs(beta))+
	q21*(alpha-x1)*(y2-abs(beta))+q12*(x2-alpha)*(abs(beta)-y1)+
	q22*(alpha-x1)*(abs(beta)-y1))/((x2-x1)*(y2-y1));
	csi=q[3]+gamma*sign(beta)*f4;
if alpha=1 then delta=csi;
else delta=csi-beta*gamma*tan(pi*alpha/2);

	parms=j(1,4,0);
	parms[1,1]=alpha;
	parms[1,2]=beta;
	parms[1,3]=gamma;
	parms[1,4]=delta;
	create parms from parms;append from parms;
quit;

* dataset parms contains the estimates;
data parms;set parms;
rename col1=alpha;
rename col2=beta;
rename col3=gamma;
rename col4=delta;
run;

%mend;

************************************************************
************************************************************
*EXAMPLE
*A simulated stable distribution y with the parameters 
alpha=1.5,beta=0,delta=0,gamma=1 and 100 obervations 
is created in the dataset date;



* The macro %stable simulates a random variable y under parameterisation S1;

%macro stable(alpha=,beta=,delta=,gamma=,n=);
*If alfa<>1, then use the following code;

%macro s_alpha;
pi=constant('pi');
u=pi*ranuni(0)-pi/2;
ex=ranexp(1);
s_a_b=(1+(&beta**2)*(tan(pi*&alpha/2))**2)**(1/(2*&alpha));
b_a_b=atan(&beta*tan(pi*&alpha/2))/&#945;
x=s_a_b*(sin(&alpha*(u+b_a_b)))/(cos(u)**(1/&alpha))*(cos(u-&alpha*(u+b_a_b))/ex)
**((1-&alpha)/&alpha);
y=&gamma*x+&#948;
%mend;

*If alfa=1, then use the following code;

%macro s_alpha_1;
pi=constant('pi');
u=pi*ranuni(0)-pi/2;
ex=ranexp(1);
x=(2/pi)*(pi/2+&beta*u)*tan(u)-&beta*log(pi/2*ex*cos(u)/(pi/2+&beta*u));
y=&gamma*x+2/pi*&beta*&gamma*log(&gamma)+&#948;
%mend;
%if &alpha=1 %then %do;
	data date(keep=y);            
	%do i=1 %to &n;
	%s_alpha_1;
		output;
	%end;

	run;
%end;
%if &alpha ne 1 %then %do;
data date(keep=y);            
	%do i=1 %to &n;
	%s_alpha;
		output;
	%end;
	run;
%end;

%mend;

*A simulated stable distribution y with the parameters 
alpha=1.5,beta=0,delta=0,gamma=1 and 100 obervations 
is created in the dataset date;
%stable(alpha=1.5,beta=0,delta=0,gamma=1,n=100) ;

*Use macro mc_culloch for estimating the parameters;

%mc_culloch(data=date, var=y);

*Macro %simulate generates n_iter stable distributions and 
estimates the paramters;

%macro simulate(n_iter=);
%let it=1;
%do %until (&it>&n_iter);

%if &it>0 %then %do;
	%stable(alpha=1.5,beta=0,delta=0,gamma=1,n=100) ;
	%mc_culloch(data=date, var=y);

proc append base=results data=parms
force; 
quit; 
 	%end;
	%let it=%eval(&it+1);
%end;
%mend;

%simulate(n_iter=100);


proc univariate data=results;
var alpha;
histogram/normal;
run;
```

automatically created on 2018-05-28
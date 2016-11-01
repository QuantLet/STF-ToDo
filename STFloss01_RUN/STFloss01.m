% clear variables and close windows
clear all
close all
clc

% Pseudo random numbers
RandStream.setGlobalStream(RandStream('mt19937ar','seed',2012));

% linear intensity
T=10;
y1=simNHPP(1,[1,0],T,1);
n1=length(find(y1<T));

y2=simNHPP(1,[1,0.1],T,1);
n2=length(find(y2<T));

y3=simNHPP(1,[1,1],T,1);
n3=length(find(y3<T));

stairs([y1(1:n1);T],(0:n1),'--k','LineWidth',2);
hold on
stairs([y2(1:n2);T],(0:n2),'-.r','LineWidth',2);
stairs([y3(1:n3);T],(0:n3),'LineWidth',2);
xlabel('t','FontSize',16,'FontWeight','Bold');
ylabel('N(t)','FontSize',16,'FontWeight','Bold');
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
box on

% sinusoidal intensity

y1=simNHPP(0,[10,0,1/4],T,1);
n1=length(find(y1<T));

y2=simNHPP(0,[10,1,1/4],T,1);
n2=length(find(y2<T));

y3=simNHPP(0,[10,10,1/4],T,1);
n3=length(find(y3<T));

figure
stairs([y1(1:n1);T],(0:n1),'--k','LineWidth',2);
hold on
stairs([y2(1:n2);T],(0:n2),'-.r','LineWidth',2);
stairs([y3(1:n3);T],(0:n3),'LineWidth',2);
xlabel('t','FontSize',16,'FontWeight','Bold');
ylabel('N(t)','FontSize',16,'FontWeight','Bold');
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
box on

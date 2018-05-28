[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **ruinmix2exps** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: ruinmix2exps

Published in: Statistical Tools for Finance and Insurance

Description: 'Produces the exact ruin probability in infinite time for insurance collective risk model with mixture of 2 exponentials distribution claims. This function is used by STFruin04.m.'

Keywords: risk, portfolio-insurance, risk management, exponential, model

See also: STFruin04, STFruin04

Author: Zografia Anastasiadou

Submitted: Fri, May 04 2012 by Dedy Dwi Prastyo
```

### MATLAB Code
```matlab

function [ y ] = ruinmix2exps(u,theta,dparameters);
   
    % u: initial capital for risk process
	% theta: security loading in insurance collective risk model
	% dparameters: matrix, composed of 2 columns containing the parameters of loss distribution, exponential parameters (first column) and weights (second column)
    
    p1=dparameters(:,1); % exponential parameters
    p2=dparameters(:,2); % weights
    p=p2(1)/p1(1)/(p2(1)/p1(1)+(1-p2(1))/p1(2));
    psii=p1(1)*(1-p)+p1(2)*p;
    r1=(psii+theta*sum(p1)-sqrt((psii+theta*sum(p1))^2-4*prod(p1)*theta*(1+theta)))/(2*(1+theta));
    r2=(psii+theta*sum(p1)+sqrt((psii+theta*sum(p1))^2-4*prod(p1)*theta*(1+theta)))/(2*(1+theta));
    y=1/((1+theta)*(r2-r1))*((psii-r1)*exp(-r1*u)+(r2-psii)*exp(-r2*u)); % ruin probability using the Laplace transform inversion
   
end


```

automatically created on 2018-05-28
function y=nigmml(v,x)
a=v(1);
b=v(2);
d=v(3);
m=v(4);
n=length(x);
pom=a^2-b^2;
if d>0 & pom>0 & a>0 & a<100
    g=sqrt(pom);
    if all(besselk(1,a*sqrt(d^2+(x-m).^2)))>0
        y=-n*(log(a*d/pi))-sum(log(besselk(1,a*sqrt(d^2+(x-m).^2))))+sum(log(sqrt(d^2+(x-m).^2)))-n*d*g-b*sum(x-m);
    else
        y=realmax;
    end
else
    y=realmax;
end;
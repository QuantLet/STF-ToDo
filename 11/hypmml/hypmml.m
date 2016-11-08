function y=hypmml(v,x)
a=v(1);
b=v(2);
d=v(3);
m=v(4);
n=length(x);
pom=a^2-b^2;
if d>0 & pom>0 & a>0
    g=sqrt(pom);
    if besselk(1,d*g)>0
        y=-n*(log(g/(2*a*d*besselk(1,d*g))))+a*sum(sqrt(d^2+(x-m).^2))-b*sum(x-m);
    else
        y=realmax;
    end
else
    y=realmax;
end;
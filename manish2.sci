clc;clear;clf();
function [y,y1,y2] = z(e,g,T,b)
    n=length(e)
    y = sum(exp(-b*e)*g',n);  // Vectorized operation
    y1 = sum(-exp(-b*e)*(g.*e)',n);
    y2=sum(exp(-b*e)*(g.*e.*e)',n);
    //end
endfunction
e=[0,1,2,3,4];
g=[3, 2,3,1,1];
T=(0:100:1e6)';
k=8.617D-5;
b=1./(k*T);
[z1,dz,d2z]=z(e,g,T,b)
//probability Pi
subplot(2,2,1)
pl=1./ z1;
pu=exp(-b*3)./z1;
plot(T, pl);
//energy
subplot(2,2,2)
E = -dz./z1;
plot(b, E);
//entropy
subplot(2,2,3)
s = log(z1) + b.*E;
plot(b, s);
//specific heat
 subplot(2,2,4)
 Cv=(b.^2).*(dz.^2+z1.*d2z)./(z1.^2)
 plot(b,Cv)

clc;clear;clf();
function [y,y1,y2] = z(e,g,T,b)
    n=length(e)
    y = sum(exp(-b*e)*g',n);  // Vectorized operation for Z(partition fn)
    y1 = sum(-exp(-b*e)*(g.*e)',n);// dZ/db b=beeta
    y2=sum(exp(-b*e)*(g.*e.*e)',n);// d2Z/db2  
    //end
endfunction
e=[0,1,2,3,4];//constant in front of possible energy for Z like 0,e,2e,3e,4e,.....
g=[3,2,3,1,1];// degeneracy g in front of exp in expression of Z like 3+2exp(-be)+3exp(-2be)+.....
T=(0:100:1e5)';
k=8.617D-5;
b=1./(k*T);
[z1,dz,d2z]=z(e,g,T,b)
//probability Pi
subplot(2,2,1)
p1=g(1)*exp(-b*e(1))./z1;//Pi=g(i)*exp(-b*e(i))./z1
p2=g(2)*exp(-b*e(2))./z1;//above expression calculates probability
p3=g(3)*exp(-b*e(3))./z1;//use it for as many Pi as you want
p4=g(4)*exp(-b*e(4))./z1;
p5=g(5)*exp(-b*e(5))./z1;
plot(T, [p1 p2 p3 p4 p5]);//plot wrt temp
legend("P1","P2","P3","P4","P5")
//energy
subplot(2,2,2)
E = -dz./z1;
plot(b, E);//plot wrt beta
//entropy
subplot(2,2,3)
s = log(z1) + b.*E;
plot(T, s);
//specific heat
 subplot(2,2,4)
 Cv=(b.^2).*(dz.^2+z1.*d2z)./(z1.^2)
 plot(T,Cv)

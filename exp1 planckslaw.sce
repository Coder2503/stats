clc;clear;clf();
h=6.626e-34; kb=1.38e-23; c=3e8
temp=1200:100:1700; 
L0=0.5:0.002:30
l=L0*1e-6; temp0=1500;
a=8*%pi*h*c;
figure(0);scf(0);clf(0);
for i=1:length(temp)
    for j=1:length(L0)
        Ep(i,j)=(a/(l(j)^5))/(exp(h*c/(l(j)*kb*temp(i)))-1)//planck black body radiaton law
        Ew(i,j)=(a/(l(j)^5))/(exp(h*c/(l(j)*kb*temp(i))))//wein black body radiaton law
        Erj(i,j)=(a/(l(j)^4))*(kb*temp(i)/(h*c))//rayleigh jean black body radiaton law
    end
    plot(L0,Ep)
    plegend(i)=["T="+string(temp(i))]
     [m,k]=max(Ep(i,:));//wein disp law
    Lmax(i)=L0(k);//wein disp law
    U(i)=(0.002e-6)*sum(Ep(i,:));// stefans law
    //integration in stefan law by trapezoidal rule
    //integration=(h/2)*(U1+2*U2+2*U3+....2*Un-1+Un)
    //take U1=Un=0; h=step size of wavelength vector
    //it become h*sum(U_vector);
    if temp(i)==temp0 then q=i end//3 law at one temp
end
replot([0.5 max(L0)/3;0 %nan])
L=legend(plegend,1)
//all 3 law at one common temperature
figure(1);scf(1);clf(1);
plot(L0',[Ep(q,:)' Ew(q,:)' Erj(q,:)'])
replot([0 0.33*max(L0);0 max(Ep(q,:))*1.05])
L=legend("Planck''s law","Wien''s law","Reyleigh-Jeans law")
//plot for wein displacement law
figure(2);scf(2);clf(2);
plot(1./temp,Lmax')
L=legend("max Wavelength in Planck''s plot",4)
//wein constant in wein displacement law
disp("Temperature(T)  Lambda_max(um)  Lambda_max*T(um K)")
disp([temp' Lmax Lmax.*temp' ])
//stefan law
figure(3);scf(3);clf(3);
E=U*c/4
plot(temp.^4,E)
disp("Temperature(T)  E  E/T^4")
disp([temp' E E./temp'.^4 ])

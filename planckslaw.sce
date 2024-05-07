clc;clear;clf();
h=6.626e-34; kb=1.38e-23; c=3e8
temp=1200:100:1700; 
L0=0.5:0.002:30
l=L0*1e-6; temp0=1500;
a=8*%pi*h*c;
figure(0);scf(0);clf(0);
for i=1:length(temp)
    for j=1:length(L0)
        Ep(i,j)=(a/(l(j)^5))/(exp(h*c/(l(j)*kb*temp(i)))-1)
        Ew(i,j)=(a/(l(j)^5))/(exp(h*c/(l(j)*kb*temp(i))))
        Erj(i,j)=(a/(l(j)^4))*(kb*temp(i)/(h*c))
    end
    plot(L0,Ep)
    plegend(i)=["T="+string(temp(i))]
     [m,k]=max(Ep(i,:));//wein disp law
    Lmax(i)=L0(k);//wein disp law
    if temp(i)==temp0 then q=i end//3 law at one temp
end
replot([0.5 max(L0)/3;0 %nan])
L=legend(plegend,1)

figure(1);scf(1);clf(1);
plot(L0',[Ep(q,:)' Ew(q,:)' Erj(q,:)'])
replot([0 0.33*max(L0);0 max(Ep(q,:))*1.05])
L=legend("Planck''s law","Wien''s law","Reyleigh-Jeans law")

disp("Temperature(T)  Lambda_max(um)  Lambda_max*T(um K)")
disp([temp' Lmax Lmax.*temp' ])

figure(2);scf(2);clf(2);
plot(1./temp,Lmax')
L=legend("max Wavelength in Planck''s plot",4)

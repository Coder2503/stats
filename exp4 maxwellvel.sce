clc;clear;clf();
kb=1.38e-23;Na=6.022e23;
Elmnt=["Nitrogen";"Oxygen";"Flourine";"Neon"]
m1=[28;32;19;20]
m=m1/(Na*1000);
T=400:400:1600;
v=0:2:2000;
v2=v.^2;iter=1;
style=['k-d';'k-o';'k-x';'k-']
//at different temperature for one mass 
subplot(1,2,1)
for i=1:length(T)
     for j=1:length(v)
          P_m(i,j)=4*%pi*v2(j)*((m(1)/(2*%pi*kb*T(i)))^1.5)*exp(-0.5*m(1)*v2(j)/(kb*T(i)))
     end
     [m,k]=max(P_m(i,:))
     //v represent theoritical value, V represent calculated value
     vmp_m(i)=sqrt(2*kb*T(i)/m1(1)); vav_m(i)=sqrt(8*kb*T(i)/(m1(1)*%pi)); vrms_m(i)=sqrt(3*kb*T(i)/m1(1))
     Vmp_m(i)=v(k);  Vav_m(i)=(4*P_m(i,1:2:$)*v(1:2:$)'+2*P_m(i,2:2:$)*v(2:2:$)')/3
     Vrms_m(i)=sqrt((4*P_m(i,2:2:$-1)*v2(2:2:$-1)'+2*P_m(i,3:2:$-1)*v2(3:2:$-1)')/3)
     disp([T(i) vmp_m(i) Vmp_m(i) vav_m(i) Vav_m(i) vrms_m(i) Vrms_m(i)])
     plot(v(1:10:$),P_m(i,1:10:$),style(i),'linewidth',2)
     l(i)=["T="+string(T(i))]
end
title("Maxwell velocity distribution for "+Elmnt(1)+"(mol mass="+string(m1(1))+" g/mol)",'fontsize',6)
xlabel("Velocity(m/s)",'fontsize',5)
ylabel("P(v)",'fontsize',5)
L=legend(l)
// for diffrent mass at one temp
subplot(1,2,2)
for i=1:length(m)
     for j=1:length(v)
          P_t(i,j)=4*%pi*v2(j)*((m(i)/(2*%pi*kb*T(1)))^1.5)*exp(-0.5*m(i)*v2(j)/(kb*T(1)))
     end
     [m,k]=max(P_t(i,:))
     vmp_t(i)=sqrt(2*kb*T(1)/m1(i)); vav_t(i)=sqrt(8*kb*T(1)/(m1(i)*%pi)); vrms_t(i)=sqrt(3*kb*T(1)/m1(i))
     Vmp_t(i)=v(k); Vav_t(i)=(4*P_t(i,2:2:$-1)*v(2:2:$-1)'+2*P_t(i,3:2:$-1)*v(3:2:$-1)')/3
     Vrms_t(i)=sqrt((4*P_t(i,2:2:$-1)*v2(2:2:$-1)'+2*P_t(i,3:2:$-1)*v2(3:2:$-1)')/3)
     disp([m(i) vmp_t(i) Vmp_t(i) vav_t(i) Vav_t(i) vrms_t(i) Vrms_t(i)])
     plot(v(1:10:$),P_t(i,1:10:$),style(i),'linewidth',2)
     l(i)=["Element:"+Elmnt(i)+", mol mass="+string(m1(i))+" g/mol"]
end
title("Maxwell velocity distribution for T="+string(T(1))+"K",'fontsize',6)
xlabel("Velocity(m/s)",'fontsize',5)
ylabel("P(v)",'fontsize',5)
L=legend(l)

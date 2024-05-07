clc;clf();clear;
Kb=1.38e-23;N=6.022e23;
M=[2 28 32];M1=M/(N*1000);
E=["Hydrogen" "Nitrogen" "Oxygen"];
T=500:200:1500;
v=2:1:30000;
To=1000
for m=1:length(M)
     disp("For "+E(m))
     disp("Temperature  Vmp(m/s)     Vmpt         Vav(m/s)          Vavt          Vrms(m/s)     Vrmst")
     for i=1:length(T)
          for j=1:length(v)
               P(i,j)=4*%pi*v(j)^2*(M(m)/(2*1000*%pi*N*Kb*T(i)))^1.5*exp(-M(m)*v(j)^2/(2*1000*N*Kb*T(i)))
          end
          scf(m-1)
          plot(v,P(i,:),'linewidth',2)
          xgrid()
          xtitle("Plot of Maxwell speed distribution for "+string(E(m)),"v(m/s)","P(v)")
          A(i)=["T="+string(T(i))+" K"]
          [max1,k]=max(P(i,:))
          Vav=(2*P(i,1:2:$)*v(1:2:$)'+4*P(i,2:2:$)*v(2:2:$)')/3
          Vrms=sqrt((2*P(i,1:2:$)*(v(1:2:$).^2)'+4*P(i,2:2:$)*(v(2:2:$).^2)')/3)
          Vmp=v(k)
          Vavt=sqrt((8*Kb*T(i))/(%pi*M1(m)))
          Vmpt=sqrt((2*Kb*T(i))/M1(m))
          Vrmst=sqrt((3*Kb*T(i))/M1(m))
          disp('   '+string(T(i))+' K      '+string(Vmp)+'       '+string(Vmpt)+'       '+string(Vav)+'      '+string(Vavt)+'       '+string(Vrms)+'     '+string(Vrmst))
     end
     legend(A)
end
for m=1:length(M)
     for k=1:length(v)
          X(m,k)=4*%pi*v(k)^2*(M(m)/(2*1000*%pi*N*Kb*To))^1.5*exp(-M(m)*v(k)^2/(2*1000*N*Kb*To))
     end
     scf(4)
     plot(v,X(m,:),'linewidth',2)
     xgrid()
     B(m)=["Plot of Maxwell speed distribution for "+string(E(m))+" at T = "+string(To)+" K"]
     xtitle("Maxwell speed Distribution for different gasaes at T = 1000 K","v(m/s)","P(v)")
end
legend(B)

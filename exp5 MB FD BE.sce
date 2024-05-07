clc;clear;clf();
style=['k-';'k-o';'k-d';'k-o';'k-']
t=["Bose Einstein";"Maxwell Boltzmann";"Fermi Dirac"]
a=-5:0.5:5;
figure(0);scf(0);clf(0)//all 3 distribution function in one plot
for b=-1:1
    f=1./(exp(a)+b)
    plot(a(1:2:$),f(1:2:$),style(b+3),'linewidth',2)
    replot([-5 5;0 2])
end
g=gca();g.y_location="origin"
title("Plot of statistical distribution functions",'fontsize',6)
L=legend("Bose Einstein distribution","Maxwell Boltzmann distribution","Fermi Dirac distribution")
xlabel("$(\frac{\epsilon-\mu}{K_b *T})$",'fontsize',5)
ylabel("$\bar n$",'fontsize',5)
T=[0;8000;16000;24000];
u=7;//fixed chemical potential for fermi stat
U=[2;3;5;6]//chemical potential at diff temp
//3 distribution fn in diff plot at diff temp
for b=-1:1
figure(b+2);scf(b+2);clf(b+2);
for i=1:length(T)
    if(b==-1)then 
        E=-U(i)+0.001:0.01:3;
        dim=[-max(U) max(E)/3;0  20]
        end
    if(b==1)then 
        U(i)=u; E=-U(i)+0.001:0.01:2*U(i);
        dim=[0 max(E);0 1.1]
    end
    if b==0 then 
        E=-U(i)+0.001:0.01:10;
        dim=[0 max(E);0 1.1];
        end
    for j=1:length(E)
    nf(i,j)=1/(exp((E(j)-b*U(i))/(kb*T(i)))+b)
    end
    plot(E(1:10:$),nf(i,1:10:$),style(i),'linewidth',2)
    replot(dim)
    l(i)=["T="+string(int(T(i)))+"K"]
end
g=gca();g.y_location="origin"
        title("Plot of "+t(b+2)+" distribution function",'fontsize',6)
        L=legend(l)
        L.font_size=5
        xlabel("$\epsilon(eV)$",'fontsize',5)
        ylabel("$\bar n$",'fontsize',5)
end
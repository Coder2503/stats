clc;clear;clf();
kb=8.617e-5
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
L=legend("Bose Einstein distribution","Maxwell Boltzmann distribution","Fermi Dirac distribution")
//Maxwell boltzmann at diff temp
clc;clear;clf();
kb=8.617e-5;
T=[4000 6000 8000];
e=0:0.05:5
for i=1:length(T)
    for j=1:length(e)
        nmb(i,j)=1/exp(e(j)/(kb*T(i)))
    end
    plot(e,nmb(i,:))
end
legend("T=4000K","T=6000K","T=8000K")
//fermi dirac at diff temp
clc;clear;clf();
kb=8.617e-5;
T=[100 3000 8000];
e=0:0.05:6
u=3;
for i=1:length(T)
    for j=1:length(e)
        nmb(i,j)=1/(exp((e(j)-u)/(kb*T(i)))+1)
    end
    plot(e,nmb(i,:))
end
legend("T=100K","T=3000K","T=8000K")
//bose einstein at diff temp
clc;clear;clf();
kb=8.617e-5;
T=[2000 3000 4000];
u=[-2 -3 -4];
for i=1:length(T)
    e=u(i):0.05:1
    for j=1:length(e)
        nmb(i,j)=1/(exp((e(j)-u(i))/(kb*T(i)))-1)
    end
    plot(e,nmb(i,:))
end
legend("T=2000K","T=3000K","T=4000K")

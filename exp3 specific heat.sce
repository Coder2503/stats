clc;clear;clf();
mat="Iron";// replace  by "Material name" Like "Copper";
td=400;//fill value of Debye temp(in Kelvin) like 300;
te=300;//fill value of Einstein temp(in Kelvin) like 250;
Cvdp=3;
tvec=1:1:td
for t =1:td
        Cve(t)=3*((te/t)^2)*exp(te/t)/(exp(te/t)-1)^2;
        I=integrate('(exp(x)*x^4)/(exp(x)-1)^2', 'x', 0, td/t,1e-4);
        Cvdb(t)=9*I*(t/td)^3;
end
plot(tvec',[Cve Cvdb Cvdp*ones(Cve)],'linewidth',2)
L=legend("Einstein''s law","Debye''s law","Dulong-Petit law",4)

replot([%nan %nan;%nan 4])

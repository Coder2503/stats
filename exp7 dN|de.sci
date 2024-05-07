clc;clear;clf;
u=-1;u1=2
e=0:0.1:5
function y=n(e,u,T,A)
    k=8.617D-5
    for i=1:length(e)
        y=1./(exp((e-u)./(k.*T))+A)
    end
endfunction
g=(e.^2);
subplot(2,3,1)//g(e)
plot(e,g)
subplot(2,3,2)//avg occupation no at two diff temp
plot(e,n(e,u,1D3,-1),e,n(e,u,1D4,-1))
subplot(2,3,3)// C*dN/de at two diff temp(boson)
fbe=g.*n(e,u,1D4,-1)
f1be=g.*n(e,u,2D4,-1)
plot(e',fbe,e',f1be)

subplot(2,3,4)//g(e)
plot(e,g)
subplot(2,3,5)//avg occupation no at two diff temp
plot(e,n(e,u1,1D3,1),e,n(e,u1,2D1,1)')
subplot(2,3,6)// C*dN/de at two diff temp(boson)
f2fd=g.*n(e,u1,1D3,1)
f3fd=g.*n(e,u1,2D1,1)
plot(e',f2fd,e',f3fd)

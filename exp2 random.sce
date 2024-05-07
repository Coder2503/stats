clc;clear;clf();
N=[4;9;16;23]//Total no of coins OR total steps in random walk
for i=1:length(N)
     for j=0:N(i)
          P(i,j+1)=factorial(N(i))/(factorial(j)*factorial(N(i)-j)*2^N(i))
         end
         n=linspace(0,N(i),N(i)+1)
         subplot(2,2,i)
         plot(n,P(i,:),'bo-')//n= no of head OR no of forward steps, P=corresponding probability
end

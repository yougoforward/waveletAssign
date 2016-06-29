   %%%This procedure can make us understand  how the 'decent'  scale waveform and wavelet  waveform  be generated 
   %%%by iteratively upsampling and filtering on the   coefficients of
   %%%scale filters or wavelet filters.  You  should also observe the
   %%%change of vanishing moments , regularity or support size when changing
   %%%the name of wfilters.
     %%%Programmed by X.D Huang, school of imformation and engineering
   %%%,Tianjin Universiy, 16/11/2011

clc;clear;close all;
p=10;
Num=7; 


[hL,hH]=wfilters(['db', num2str(p)])
hL=fliplr(hL);  hH=fliplr(hH);
p=length(hL);
 
temp1= (hL);
temp2= (hH);


for n=1:Num;
    
    
   hLL=temp1;
   hLL=upsample(hLL,2);
   temp1=conv(hL,hLL)*sqrt(2);
      
    if n<=6
    figure(1);
    subplot(3,2,n); plot(temp1);
    legend(['??',num2str(n),'?¦Å???'])

    end
    
    
    hHH=temp2;
   hHH=upsample(hHH,2);
   temp2=conv(hL,hHH)*sqrt(2);
   if n<=6
   figure(2)
    subplot(3,2,n); plot(temp2);grid on;
    legend(['??',num2str(n),'?¦Å???'])
   end
 
end

 
 
 

delta=1/2.^(Num+1);
len=length(temp1);
t=1:p/delta;
for n=0:len-1;
    t1=n/delta:(n+1)/delta-1;
    scale_fun(t1+1)=temp1(n+1);    
    wavelet_fun(t1+1)=temp2(n+1);  
 
end
dt=len*2.^(Num+1);
t=0:p/dt:p-p/dt;
figure;
subplot(2,2,1);
stem(0:length(hL)-1,hL,'.'); legend('???????????')
subplot(2,2,3);
plot(t,scale_fun);  xlabel('t'); 
title(['?????????????????????N=' int2str(Num)]);
set(gcf,'color','w')
 
subplot(2,2,2);
stem(0:length(hH)-1,hH,'.'); legend('§³??????????')
subplot(2,2,4);
plot(t-max(t)/2+0.5,wavelet_fun);  xlabel('t')
title(['??????????§³????????????N=' int2str(Num)]);
set(gcf,'color','w')

 
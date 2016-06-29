
%% This program aims to construct Daubechies biorthogonal wavelet  filters.
%%%Programed by Xiangdong Huang ,May, 2014
%%% You can specify the vanishing moments p, then everything is OK.
function   zz=bio_db_design()
clc; close all; clear all;
p1=4; p2=4;
p=(p1+p2)/2;    % the vanishing moments p
a=zeros(1,p);
syms y z
f=0;
for k=0: p-1
    a(k+1)=nchoosek(p-1+k,k);
    f=f+a(k+1)*y^k;
end
Q = subs(f,y,(2-(z+z^-1))/4);
r0=2^((p-1)/2)
Q=collect(Q);
 




[numsym,densym]=numden(Q) 
num = sym2poly(numsym)
den = sym2poly(densym)
a=num/den(1);
 zplane(a)  ;set(gcf,'color','w')
 zeros_set=roots(a);
 
 

   zp_set2=zeros_set(  find(  imag(zeros_set)==0)   );
  zp_set1=zeros_set(  find(  imag(zeros_set)~=0)   );

 
 h1=filter_back(zp_set1, p1);
 h2=filter_back(zp_set2, p2);
 
 
 [h,g,hd,gd]=wfilters(['bior',num2str(p1),'.',num2str(p2)]);
 
 disp('the acquired original low pass filter')
 real(h1)
  disp('the standard original low pass filter in matlab library')
 h 
 
  disp('the acquired dual low pass filter')
 real(h2)
  disp('the standard dual  low pass filter in matlab library')
 hd 
 
 disp('Program over ')

    function h=filter_back(zp_set, p)
         len =length (zp_set );
 conv_set=zeros(len ,2);
 conv_set(:,1)=1;
 conv_set(:,2)=- zp_set.';
 temp=conv_set(1,:);
 for k=2:len 
     temp=conv(temp, conv_set(k,:) );
 end
 for k=1:p;
     temp=conv(temp,[1/2 1/2]);
 end
 h=temp/sum(temp)*sqrt(2);
 
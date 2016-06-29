%Level 5 Approximation Coefficients
%This example shows how to extract the level 3 approximation coefficients.
%Load the signal consisting of electricity usage data.

% load sumsin;
% sig = sumsin(1:1000);
% figure,
% plot(sig);title('sig of sumsin');
% 
% % Obtain the DWT down to level 5 with the 'db4' wavelet.
% [C,L] = wavedec(sig,5,'db4');
% % Extract the level 1-5 approximation coefficients. Plot the original signal and the approximation coefficients.
% a = cell(5,1);
% for Lev = 1:5
%     a{Lev,1} = appcoef(C,L,'db4',Lev);
% end
% figure,
% subplot(2,3,1)
% plot(sig); title('Original Signal of sumsin');
% subplot(2,3,2)
% plot(a{1}); title('Level-1 Approximation Coefficients');
% subplot(2,3,3)
% plot(a{2}); title('Level-2 Approximation Coefficients');
% subplot(2,3,4)
% plot(a{3}); title('Level-3 Approximation Coefficients');
% subplot(2,3,5)
% plot(a{4}); title('Level-4 Approximation Coefficients');
% subplot(2,3,6)
% plot(a{5}); title('Level-5 Approximation Coefficients');


%rec
load sumsin;
sig = sumsin(1:1000);
% Perform decomposition of signal at level 3 using db4. 
[C,L] = wavedec(sig,3,'db4');%C =[cA3,cD3,cD2,cD1],L=[length(cA3),length(cD3),length(cD2),length(cD1),length(sig))]
C(L(1)+L(2)+1:end)=0;% set cD1=0,cD2 =0
% Reconstruct s from the wavelet decomposition structure [c,l].
sigRec = waverec(C,L,'db4');
figure,
subplot(2,1,1),plot(sig); title('Original Signal of sumsin');
subplot(2,1,2),plot(sigRec); title('Reconstruction of Original Signal ');


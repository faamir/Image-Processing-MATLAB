%in barnamei baraye Histogram Specification ast.BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
clc;
close all;
clear all;
%Histograme tasvire matlub
IMG_Desire=imread('5.2.tif');%tasvire matlub
figure(1);
subplot(2,2,1);imshow(IMG_Desire);title('tasvire matlub');
figure(2);
subplot(2,2,1);imhist(IMG_Desire);title('histogram tasvire matlub');
IMG_Desire=double(IMG_Desire); 
%Histogram
HST=zeros(1,256);
[m n]=size(IMG_Desire);
for i=1:m
      for j=1:n
      HST(IMG_Desire(i,j)+1)=HST(IMG_Desire(i,j)+1)+1;
      end
end
P=HST/(m*n);
C(1)=P(1);
for k=2:256
    C(k)=C(k-1)+P(k);
end
L=256;
%tasvire vorudi
IMG_IN=imread('5.1.tif');
figure(1);
subplot(2,2,2);imshow(IMG_IN);title('tasvire vorudi');
IN=double(IMG_IN); 
[m,n]=size(IN);
%tedade pixel ha
Num=m*n; 
Con=reshape(IN,Num,1); 
ConP=hist(Con,[0:L-1]); 
%normalize kardan
ConP=ConP/Num;
SS=ConP*triu(ones(L));
ZZ=C;
FF=zeros(256);
BB=zeros(m,n);
for q=1:L
for p=FF(q)+1:L
if (ZZ(p)>=SS(q))
FF(q) = p;
T=find(IN == q-1); a=size(T);
BB(T)=p; 
break;
end
end
end
BB=uint8(BB);
%tarsimat
figure(1);
subplot(2,2,3);imshow(BB);title('tasvire khoruji:histogram specification');
figure(2);
subplot(2,2,2);imhist(IMG_IN);title('histogram tasvire vorudi');
subplot(2,2,3);imhist(BB);title('histogram tasvire specification');

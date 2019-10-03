%in barnamei baraye Tarmime aks ba GAUSSIAN LOWPASS filter ast,
%BARAYE EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID VA MEGHDAR SHOAE D0 RA BEDAHID.
clc;
clear all;
close all;
%tasvire vorudi
IMG_In=imread('6.tif');
F = fft2(double(IMG_In));
F1=fftshift(F);

%Gaussian filter
[M N]=size(F); 
D0=input('shoaae D0 ra vared konid: '); 
X=0:N-1;
Y=0:M-1;
[X Y]=meshgrid(X,Y);
x=N/2;
y=M/2;
ff=((X-x).^2+(Y-y).^2);
HL=exp(-ff./(2*D0).^2);
% lowpass
nn=F1.*HL;
nn1=ifftshift(nn);
IMG_Out=ifft2(nn1);

%tarsime tasavir
figure(1);
imshow(IMG_In);title('tasvire vorudi');
figure(2);
imshow(abs(IMG_Out),[0 255]);title(['tasvire khoruji Gaussian HLwpass filter ba D0 = ' num2str(D0)]);

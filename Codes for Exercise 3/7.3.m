%in barnamei baraye GAUSSIAN HIGHPASS filter tasvir ast,
%BARAYE EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID VA MEGHDAR SHOAE D0 RA BEDAHID.
clc;
clear all;
close all;
%tasvire vorudi
IMG_In=imread('5.tif');
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
HH=1-HL;
nn=F1.*HH;
nn1=ifftshift(nn);
IMG_Out=ifft2(nn1);

%tarsime tasavir
figure(1);
subplot(1,2,1);imshow(IMG_In);title('tasvire vorudi');
subplot(1,2,2);imshow(abs(IMG_Out),[0 255]);title(['tasvire khoruji Gaussian HLwpass filter ba D0 = ' num2str(D0)]);
figure(2);mesh(X,Y,HH);title('Gaussian e tasvire khoruji');

   
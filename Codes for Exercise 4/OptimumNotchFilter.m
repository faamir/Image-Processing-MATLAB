%%in barnamei baraye OPTIMUM NOTCH FILTER ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc
clear all; 
close all;
I=imread('10.tif');
I=rgb2gray(I);
I=imresize(I,[400 400]);
FFT = fft2(double(I));
FFT1=fftshift(FFT);
figure(1);
subplot(2,2,2);imshow(log10(FFT1),[]);title('spectrum tasvire vorudi');
[rows cols]=size(FFT);
[X,Y] = meshgrid(1:cols, 1:rows);
W = 200;
D0 = 110;
DD = sqrt((X - cols/2).^2 + (Y - rows/2).^2);
%butterworth bandpass filter
n = 2;
B = 1-1 ./ (1 + (W*DD./(DD.^2-D0^2)).^(2*n));
nn=FFT1.*B;
nn1=ifftshift(nn);
IMG_Out=ifft2(nn1);

%tarsime tasavir
figure(1);
subplot(2,2,1);imshow(I);title('tasvire vorudi');
subplot(2,2,3);imshow(abs(IMG_Out),[0 255]);title('tasvire khoruji Butterworth band pass filter');

NN=B.*FFT1;
EE=inv(NN);
BB=ifftshift(ifft2(EE));
I=double(I);
MeanI=mean(I);
MeanEE=mean(EE);
VarEE=var(EE);
MeanIEE=mean(I.*EE);
WW=(MeanIEE-(MeanI.*MeanEE))./(VarEE.^2-MeanEE.^2);
SS=(FFT1)-(sum(WW).*(EE));
SS=ifftshift(ifft2(SS));
dc=I-(IMG_Out) ;
figure(1);
subplot(2,2,4);imshow(dc,[0 255]);title('tasvire khoruji optimum notch filter');  

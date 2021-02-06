%%in barnamei baraye BUTTERWORTH BAND REJECT ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc
clear all; 
close all;
%tasvire vorudi
Img_in=imread('1.jpg');
FFT = fft2(double(Img_in));
FFT1=fftshift(FFT);
[M N]=size(FFT);
[X,Y] = meshgrid(1:N, 1:M);
W = 30;
D0 = 50;
DD = sqrt((X - N/2).^2 + (Y - M/2).^2);
%band reject filter
n = 1;
B = 1 ./ (1 + (W*DD./(DD.^2-D0^2)).^(2*n));
figure;
imshow(B,[]);
figure;
surfl(X, Y, double(B)); 
shading interp 
colormap(gray);
nn=FFT1.*B;
nn1=ifftshift(nn);
IMG_Out=ifft2(nn1);
%tarsime tasavir
figure(3);
subplot(1,2,1);imshow(Img_in);title('tasvire vorudi');
subplot(1,2,2);imshow(abs(IMG_Out),[0 255]);title(['tasvire khoruji Butterworth band reject filter ba W = ',num2str(W)]);

 
 
 

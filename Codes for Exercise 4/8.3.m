%%in barnamei baraye IDEAL BAND REJECT ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc
clear all; 
close all;
Img_in=imread('1.jpg');
FFT = fft2(double(Img_in));
FFT1=fftshift(FFT);
[M N]=size(FFT);
[X,Y] = meshgrid(1:N, 1:M);
W = 30;
D0 = 50;
DD = sqrt((X - N/2).^2 + (Y - M/2).^2);
%ideal band reject filter
I = ~((DD >= D0 - W/2)&(DD <= D0 + W/2));
figure;
imshow(I,[]); 
figure;
surfl(X, Y, double(I)); 
shading interp 
colormap(gray);
nn=FFT1.*I;
nn1=ifftshift(nn);
IMG_Out=ifft2(nn1);
%tarsime tasavir
figure;
subplot(1,2,1);imshow(Img_in);title('tasvire vorudi');
subplot(1,2,2);imshow(abs(IMG_Out),[0 255]);title(['tasvire khoruji Ideal band reject filter ba W = ' num2str(W)]);

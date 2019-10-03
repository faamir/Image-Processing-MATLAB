%%in barnamei baraye WIENER FILTER ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
clear all;
clc;
close all;
Img_in=imread('11.tif');
figure(1);
imshow(Img_in,[]);title('tasvire vorudi');
[m,n]=size(Img_in);
FFT=fftshift(fft2(Img_in));

a=2;
b=2;
[V,U]=meshgrid(1:1:n,1:1:m);
NN=(pi*(-.1+(50*((U-m*0.5)/m))+20*((V-n*0.5)/n)));
HH= (NN.^(-1)).*(sin(NN)).*exp((-1i)*NN);
G=FFT.*HH;
Img_in=ifft2(fftshift(G));
Img_in=Img_in;
figure(2);
imshow(Img_in,[]);title('tasvir ba motion blur');
FFT=fftshift(fft2(Img_in));
k=0.01;
H=(1./HH).*((abs(HH).^2)./(abs(HH).^2)+k);
F_hat=H.*G;
Img_out=abs(ifft2(fftshift(F_hat)));
Img_out=Img_out-min(min(Img_out));
Img_out=Img_out*(255/max(max(Img_out)));

figure(3);imshow(Img_out,[]);title('tasvire khoruji Wiener filter');
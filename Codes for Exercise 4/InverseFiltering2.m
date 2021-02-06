%%in barnamei baraye INVERSE FILTERING ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img_in=imread('14.tif');
[M,N]=size(Img_in);
FFT=double(fft2(Img_in));
FFT=fftshift(FFT);
[Y,X]=meshgrid(1:1:N,1:1:M);
HH=exp(0.0025*((X-0.5*M).^2+((Y-0.5*N).^2)).^(5/6));
%shoae filter
d=sqrt((X-0.5*M).^2+(Y-0.5*N).^2) ;
D=d<70;
G=FFT./(HH);
G=G.*D;
Img_out=abs(ifft2(fftshift(G)));
Img_out=Img_out-min(min(Img_out));
Img_out=Img_out*(255/max(max(Img_out)));
figure;imshow(Img_out,[]);title('tasvire khoruji inverse filter');

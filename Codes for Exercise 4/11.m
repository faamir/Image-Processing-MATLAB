%%in barnamei baraye tolide ATOMOSPHERE TURBULENCE ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc
clear all
close all
Img_in=imread('11.tif');
figure;
imshow(Img_in);title('tasvire vorudi');
[M,N] = size( Img_in );
a=0.1;
b=0.1;
T=0.1;
k=0.0025;
[X,Y] = meshgrid(1:N, 1:M);
Y = Y - floor( M/2 );
X = X - floor( N/2 );
%turbulence
H = exp(-k*((Y).^2+(X).^2).^(5/6)); 
H = ifftshift( H );
FFT = fft2( Img_in );
F1 = H.*FFT;
Img_out = real( ifft2(F1) );
Img_out = im2uint8( mat2gray(Img_out) );
 
figure, imshow(double(Img_out), []);title(['tasvire khoruji Turbulence,k= ',num2str(k)]);
 
 
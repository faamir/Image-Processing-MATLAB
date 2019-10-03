%%in barnamei baraye MOTION BLUR(frequncy) ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc
clear all;
close all;
a=0.3;
b=0.5;
T=1;
Img_in=imread('cameraman.tif');
[M,N] = size( Img_in );
[X,Y] = meshgrid(1:N, 1:M);
Y = Y - floor( M/2 );
X = X - floor( N/2 );
NN = pi*( Y*a + X*b + eps);
HH = T./NN .* sin( NN ) .* exp( -1j*NN );
HH = ifftshift( HH );
FFT = fft2( Img_in );
F1 = HH.*FFT;
Img_out = real( ifft2(F1) );
Img_out = im2uint8( mat2gray(Img_out) );
imshow(Img_out);title('tasvire khoruji motion blur');
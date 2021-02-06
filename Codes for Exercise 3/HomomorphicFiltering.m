%in barnamei baraye HOMOMORPHIC FILTERING tasvir ast,
%BARAYE EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID
clc;
clear all;
close all;
%tasvire vorudi
IMG_In = im2double(imread('9.tif'));
IMG_Ln = log(IMG_In+1.3);
F = fftshift(fft2(IMG_Ln));
H = zeros(size(IMG_In));
[M,N]=size(H);
x1 = M/2; y1 = N/2;
%zarayeb
D0 = 10;
c=1; 
Gama_low = .07;
Gama_high = 2;
GG = Gama_high - Gama_low;

a = zeros(M,N);
for i=1:M
for j=1:N
D(i,j) = sqrt([i-x1]^2 + [j-y1]^2);
H(i,j) = GG*[1 - exp(-c*(D(i,j)^2/D0^2))] + Gama_low;
a(i,j) = (-1)^(i+j);
end
end
IMG_Out = real(exp(ifft2(H.*F))-1).*a;

%tarsime tasavir
figure;
subplot(1,2,1); imshow(IMG_In);
title('tasvire vorudi');
subplot(1,2,2); imshow(IMG_Out);
title('tasvire khoruji Homomorphic filtering');

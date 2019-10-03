%in barnamei baraye UNSHARP MASKING va HIGHBOOST FILTERING tasvir ast,
%BARAYE EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID VA MEGHDAR ZARIB A RA BARAYE HIGHBOOST BEDAHID.
clc;
clear all;
close all;
%tasvire vorudi
IMG_In = im2double(imread('8.tif'));
F = fftshift(fft2(IMG_In));

%filtering
[M,N] = size(IMG_In);
x1 = M/2; y1 = N/2;
a = zeros(M,N);
for i=1:M;
for j=1:N;
D(i,j) = sqrt([i-x1]^2 + [j-y1]^2);
a(i,j) = (-1)^(i+j);
end
end
%shoae D0
D0=40;
H = 1-exp(-(1/2)*[D/D0].^2);
IMG_1 = real(ifft2(H.*F)).*a;
IMG_Unsharp = IMG_In + IMG_1;
A=input('zarib (A-1) ra vared namaeid: ');
IMG_highboost = (A-1)*IMG_In + IMG_1;

%tarsime tasavir
figure;
subplot(2,2,1); imshow(IMG_In);title('tasvire vorudi');
subplot(2,2,2); imshow(IMG_Unsharp);title('tasvire khoruji: Unsharp masking');
subplot(2,2,3); imshow(IMG_highboost);title('tasvire khoruji: Highboost filtering');
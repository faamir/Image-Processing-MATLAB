%%in barnamei baraye INVERSE FILTERING ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
I1 = fspecial('motion',10,30); 
Img_in = im2double(imread('14.tif')); 
FFT = fft2(I1,size(Img_in,1),size(Img_in,2));
BB = real(ifft2(FFT.*fft2(Img_in)));
figure;
imshow(BB)
S = 10^(-40/20)*abs(1-0);
BB_noise = BB + S*randn(size(BB));
imshow(BB_noise)
INV = real(ifft2(fft2(BB_noise)./FFT));
figure;
imshow(INV)
FFT_abs = abs(FFT);
PINV = real(ifft2((abs(FFT) > 0.1).*fft2(BB_noise)./FFT));

figure;
imshow(PINV)
title('inverse filter')
figure;
imshow(BB_noise)
title('tasvire blur shode')
PINV2 = real(ifft2(fft2(BB_noise).*conj(FFT)./(abs(FFT).^2 + 1e-2)));
figure;
imshow(PINV2)
title('tasvire khoruji inverse filter')

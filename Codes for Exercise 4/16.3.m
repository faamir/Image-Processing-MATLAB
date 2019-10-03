%%in barnamei baraye WIENER FILTER ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
Img_in = im2double(imread('cameraman.tif'));
figure;imshow(Img_in);
title('tasvire vorudi');
L = 21;
T = 11;
PP = fspecial('motion', L, T);
Blur = imfilter(Img_in, PP, 'conv', 'circular');
M = 0;
VAR = 0.0001;
BN = imnoise(Blur, 'gaussian',M, VAR);
figure; imshow(BN);title('tasvire blur ba noise gaussian')
ES = VAR / var(Img_in(:));
WI = deconvwnr(BN, PP, ES);
figure; imshow(WI);title('tasvire khoruji Wiener filter');


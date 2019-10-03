%in barnamei baraye BUTTERWORTH HIGHPASS filter tasvir ast,
%BARAYE EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID VA MEGHDAR SHOAE D0 RA BEDAHID.
clc;
clear all;
close all;
%tasvire vorudi
IMG_In=imread('5.tif');

%butterworth filter
D0=input('shoaae D0 ra vared konid: ');%Cutoff frequenY
n=2;
[M,N] = size(IMG_In);
X = round(M/2); % find the center of the image
Y = round (N/2);
IMG_F=fftshift(fft2(IMG_In));
H=zeros(M,N);
for i = 1 : M
    for j =1 : N
        D = sqrt((i-X).^2 + (j-Y).^ 2);
        H(i,j) = 1/(1+((D0/D).^(2*n)));
    end;
end;

G = (IMG_F .* H);
IMG_Out = abs(ifft2(1-G));

%tarsime tasavir
figure;
subplot(1,2,1);imshow(IMG_In);title('tasvire vorudi');
subplot(1,2,2);imshow(uint8(IMG_Out));title(['tasvire khoruji Butterworth lowpass filter ba D0 = ' num2str(D0)]);

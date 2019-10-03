%in barnamei baraye OTSU Method (CHAND SATHI SAZI) ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img=imread('5.tif');
zz = zeros(size(Img));
%threshold
T = [90,190,255];

for k = 1 : numel(T)-1
    lo = T(k);
    up = T(k+1);

    zz(Img >= lo & Img < up) = k;
end

reout = uint8(255*(zz - min(zz(:))) / (max(zz(:)) - min(zz(:))));
figure(1);
subplot(2,1,1);
imshow(Img);title('tasvire vorudi');
subplot(2,1,2);
imhist(Img);title('histogram tasvire vorudi');
figure(2);
subplot(2,1,1);
imshow(reout);title('tasvire khoruji Otsu method chand sathi sazi');
subplot(2,1,2);
imhist(reout);title('histogram tasvire khoruji Otsu method chand sathi');
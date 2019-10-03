%in barnamei BARAYE Local Histogram statistics e tasvir ast.BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
clc;
clear all;
close all;
%tasvire vorudi
IMG_IN = im2double(imread('8.tif'));
%miangin giri az tasvire vorudi
Mian = mean(IMG_IN(:));
D = sqrt(var(IMG_IN(:)));
E = 3;
k0 = 0.4;
k1=0.04;
k2=0.4;
%miangin haye mahali
LOCAL = ones(3,3)/9; IMG_1 = conv2(IMG_IN,LOCAL,'same');
%enheraf meyar mahali
IMG_2 = zeros(size(IMG_1,1)+2, size(IMG_1,2)+2);
IMG_2(2:size(IMG_2,1)-1, 2:size(IMG_2,2)-1) = IMG_1;
IMG_3 = zeros(size(IMG_1));
bb = zeros(1,9);
for i=1:size(IMG_IN,1)
for j=1:size(IMG_IN,2)
bb(:) = IMG_2(i:i+2,j:j+2);
IMG_3(i,j) = sqrt(var(bb));
end
end
%mask ha
Miangir_Img = zeros(size(IMG_1)); var_Img = zeros(size(IMG_3));
Miangir_Img(find(IMG_1<=k0*Mian)) = 1;
var_Img(find(IMG_3>=k1*D & IMG_3<=k2*D)) = 1;
IMG_4=E*Miangir_Img.*var_Img;
IMG_4(find(IMG_4<E))=1;
IMG_5 = IMG_IN.*IMG_4;
%tarsime tasavir
figure;
subplot(1,2,1); imshow(IMG_IN); title('tasvire vorudi');
subplot(1,2,2); imshow(IMG_5); title('tasvire khoruji local histogram statistics');
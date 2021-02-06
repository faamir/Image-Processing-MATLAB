%in barnamei baraye GRADIENT GIRI BA OPERATOR SOBEL az tasvir ast.BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
clc;
clear all;
close all;
% TASVIRE VORUDI
IMG_IN = imread('13.tif');     
IMG_IN = double(IMG_IN);
%gereftane eela'ate tasvir
ER = size(IMG_IN, 1);
AR = size(IMG_IN, 2);
nn = size(IMG_IN, 3);
% tasvire khoruji
IMG_OUT = zeros(size(IMG_IN));
% mask ha
x1 = [-1 -2 -1; 0 0 0; 1 2 1];
y1 = [-1 0 1; -2 0 2; -1 0 1];
% mohasebe baraye har pixel
for i = 2 : ER - 1
   for j = 2 : ER - 1
       for k = 1 : nn
           tm = IMG_IN(i - 1 : i + 1, j - 1 : j + 1, k);
           Gx = sum(sum(x1 .* tm)); 
           Gy = sum(sum(y1 .* tm));
           andaze_gradient = sqrt(Gx^2 + Gy^2); %andaze gradian
           andaze_gradient_taghrib = abs(Gx)+abs(Gy); %andaze gradian taghribi

           IMG_OUT(i, j, k) = andaze_gradient;
       end 
   end
end
%phase gradian
phase_gradient=atan2(Gx,Gy); 
IMG_OUT = uint8(IMG_OUT);
%tarsime tasavir
figure(1);
imshow(IMG_OUT);title('Gradient giri ba operator sobel');
figure(2);
imshow(uint8(IMG_IN));
title('tasvire vorudi');

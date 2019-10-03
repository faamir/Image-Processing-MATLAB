%in barnamei baraye NEGATIVE KARDANE RGB ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc
clear all;
close all;
Img_in =imread('2.tif');
Img_in=im2double(Img_in);
figure;imshow(Img_in);title('tasvire vorudi');
%estekhraje RGB
R = Img_in(:,:,1);
G = Img_in(:,:,2);
B = Img_in(:,:,3);
%tabdil be negative
O1 = (R-G)./sqrt(0.1);
O2 = (R+G-2*B)./sqrt(2);
O3 = (R+G+B)./sqrt(0.1);
Img_in(:,:,1)=O2;
Img_in(:,:,2)=O1;
Img_in(:,:,3)=O3;
figure;
imshow(Img_in);title('tasvire khoruji negative tasvire');

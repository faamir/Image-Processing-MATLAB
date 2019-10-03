%in barnamei baraye GRAYSCALE EROSION ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img=imread('cameraman.tif');
figure;imshow(Img);title('tasvire vorudi');
%eleman sakhtari
B=[0 0 0 1 0 0 0;0 1 1 1 1 1 0;0 1 1 1 1 1 0;1 1 1 1 1 1 1 ;0 1 1 1 1 1 0;0 1 1 1 1 1 0;0 0 0 1 0 0 0];
%B=ones(3,3);
% erosion
[X Y]=size(Img); [x y]=size(B);
x2=round(x/2); y2=round(y/2);
for r=1:X
for c=1:Y
 b1=max(r-x2,1); c1=min(r+x2,X);
 b2=max(c-y2,1); c2=min(c+y2,Y);
 T=min(Img(b1:c1,b2:c2));
 V(r,c) = min(T(:));
end;
end;
figure;
imshow(V);title('tasvire khoruji Grayscale Erosion');
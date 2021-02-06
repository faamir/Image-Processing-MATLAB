%in barnamei baraye TOP-HAT ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
BB=imread('13.tif');
%otsu threshol
level=graythresh(BB);
AA=im2bw(BB,level);

Img=im2single(imread('13.tif'));
figure(1);imshow(Img);title('tasvire vorudi');
figure(2);imshow(AA);title('binary threshold otsu');
%eleman sakhtari
%B=[0 0 0 1 0 0 0;0 1 1 1 1 1 0;0 1 1 1 1 1 0;1 1 1 1 1 1 1 ;0 1 1 1 1 1 0;0 1 1 1 1 1 0;0 0 0 1 0 0 0];
B=strel('disk',50);
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
ee=imdilate(V,B);
%Top-hat
ff=Img- ee;
ff=abs(ff);
df=im2bw(ff,0.2);
figure(3);
imshow(~df);title('tasvire khoruji binary threshold Top-Hat');

%in barnamei baraye GRAYSCALE CLOSING ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc
clear all
close all
Img=imread('12.tif');
figure;imshow(Img);title('tasvire vorudi');
%eleman sakhtari
B=[0 0 0 1 0 0 0;0 1 1 1 1 1 0;0 1 1 1 1 1 0;1 1 1 1 1 1 1 ;0 1 1 1 1 1 0;0 1 1 1 1 1 0;0 0 0 1 0 0 0];
%B=[1 1 1;1 1 1;1 1 1];
%dilation
[X Y]=size(Img); [x y]=size(B);
x2=round(x/2); y2=round(y/2);
for r=1:X
for c=1:Y
 b1=max(r-x2,1); c1=min(r+x2,X);
 b2=max(c-y2,1); c2=min(c+y2,Y);
 T=max(Img(b1:c1,b2:c2));
 V(r,c) = max(T(:));
end;
end;

%erosion
[X1 Y1]=size(V); [x1 y1]=size(B);
x21=round(x1/2); y21=round(y1/2);
for r1=1:X1
for c1=1:Y1
 b11=max(r1-x21,1); c11=min(r1+x21,X1);
 b21=max(c1-y21,1); c21=min(c1+y21,Y1);
 T1=min(V(b11:c11,b21:c21));
 V1(r1,c1) = min(T1(:));
end;
end;

figure;
imshow(V1);title('tasvire khoruji Grayscale Closing');

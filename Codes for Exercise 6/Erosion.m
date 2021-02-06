%in barnamei baraye EROSION ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img=imread('circles.png');
figure,imshow(Img);title('tasvire vorudi');
%eleman sakhtari
B=getnhood(strel('arbitrary',[1 1 1;1 1 1;1 1 1]));
%B=getnhood(strel('disk',10));
x=floor(size(B,1)/2);
y=floor(size(B,2)/2);
Pad=padarray(Img,[x y],1);
V=false(size(Img));
for i=1:size(Pad,1)-(2*x)
    for j=1:size(Pad,2)-(2*y)
       
        T=Pad(i:i+(2*x),j:j+(2*y));
       
        V(i,j)=min(min(T-B));
      
    end
end
figure,imshow(~V);title('tasvire khoruji Erosion');

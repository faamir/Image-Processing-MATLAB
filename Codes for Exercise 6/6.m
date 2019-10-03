%in barnamei baraye BOUNDARY EXTRACTION ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img=imread('6.tif');
figure,imshow(Img);title('tasvire vorudi');
%eleman sakhtari
B=getnhood(strel('disk',3));
%erosion
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
figure,imshow(~V);title('tasvire Erosion');
%boundary extraction
VV=Img-V;
figure,imshow(~VV);title('tasvire khoruji Boundary Extarction');
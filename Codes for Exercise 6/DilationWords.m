%in barnamei baraye DILATION(chsbandane horuf be ham) ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img=imread('3.2.jpg');
figure;imshow(Img,[]);title('tasvire vorudi');
Img=im2bw(Img,0.32);
Img=~Img;
%Img=imread('3.1.tif');
figure,imshow(Img);title('tasvire vorudi binary shode');

%eleman sakhtari
B=getnhood(strel('line', 60, 0));
%B=getnhood(strel('line', 35, 0));
x=floor(size(B,1)/2);
y=floor(size(B,2)/2);
Pad=padarray(Img,[x y],1);
V=false(size(Img));
for i=1:size(Pad,1)-(2*x)
    for j=1:size(Pad,2)-(2*y)
       
        T=Pad(i:i+(2*x),j:j+(2*y));
       
        V(i,j)=max(max(T&B));
      
    end
end
figure,imshow(V);title('tasvire khoruji Dilation');

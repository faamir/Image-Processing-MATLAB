%in barnamei baraye SKELETON ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
%------------------------------------
clc;
clear all;
close all;
%tasvire vorudi
Img=imread('9.jpg');
Img=im2bw(Img);
figure;imshow(Img);title('tasvire vorudi');
%eleman sakhtari
B=[0 1 0;1 1 1;0 1 0];
A = zeros(size(Img));
I = Img;
while max(max(I))
I = imerode(I,B);
A = (A|(I~=imopen(I,B)));
end
%tarsim
figure;
imshow(A);title('tasvire khoruji Skeleton');
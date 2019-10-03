%in barnamei baraye GRANULOMETRY ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img = imread('14.tif');
figure(1);subplot(1,3,1); imshow(Img), title('tasvire vorudi');
%eleman sakhtari
B = strel('disk', 20);
%smoothing
h = fspecial('average', 3);
FF=filter2(h,Img);
figure(1);subplot(1,3,2);imshow(FF,[]);title('tasvire smoth shode ba filter averaging');
%n bar opening
for cn = 0:35
    bb = imopen(FF, strel('disk', cn));
    V(cn + 1) = sum(bb(:));  
end
ee=imopen(FF,B);
figure(1);subplot(1,3,3);imshow(ee,[]);title('tasvire khoruji Opening eleman sakhtari 20');
%Granulometry
VE = abs(diff(V));
figure(2);plot(VE, 'r-'), grid on;
title('Tasvire khoruji Granulometry');
xlabel('shoaa haye eleman sakhtari');
ylabel('zarate zaher shode dar asar taghire size eleman sakhtari');


%%in barnamei baraye tolide EXPONENTIAL NOISE ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
%a=[0 0 0 0;0 0 0 0];
%b=[0.5 0.5 0.5 0.5;0.5 0.5 0.5 0.5];
%c=[0.9 0.9 0.9 0.9;0.9 0.9 0.9 0.9];
%aa=repmat(a,20,20);
%bb=repmat(b,20,20);
%cc=repmat(c,20,20);
%I=[aa bb cc;cc aa bb];
Img=imread('imageee.jpg');
Img=double(Img);
A = 30;

EXP = A*exp(-A*rand(size(Img)));
Img_noise = Img + EXP;
figure;
subplot(1,2,1);imshow(Img_noise./255);title('tasvire khoruji ba Exponential noise');
subplot(1,2,2);imhist(uint8(Img_noise));title('Histogram tasvire khorji Exponential noise');


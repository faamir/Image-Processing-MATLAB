%%in barnamei baraye tolide GAUSSIAN NOISE ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
%tolide tasvir 
a=[0 0 0 0;0 0 0 0];
b=[0.5 0.5 0.5 0.5;0.5 0.5 0.5 0.5];
c=[0.9 0.9 0.9 0.9;0.9 0.9 0.9 0.9];
aa=repmat(a,20,20);
bb=repmat(b,20,20);
cc=repmat(c,20,20);
Img=[aa bb cc;cc aa bb];
%gaussian noise
Mean= 0;
Var = 0.01;
Img = im2double(Img);
Img_out = Img + sqrt(Var)*randn(size(Img)) + Mean;

figure(1);
subplot(1,2,1);imshow(Img);title('tasvire vorudi ba 3 sathe roshanaei');
subplot(1,2,2);imshow(Img_out);title('tasvire khoruji ba Gaussian noise');
figure(2);
imhist(Img_out);title('histogram tasvire khoruji gaussian noise');


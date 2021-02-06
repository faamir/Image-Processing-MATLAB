%in barnamei baraye Jabejaei e DAMANE VA FAAZE 2 tasvir ast,
%BARAYE EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
%tasvire vorudi 1
IMG_In1=imread('cameraman.tif');
IMG_In1=imresize(IMG_In1,[300 300]);
%tasvire vorudi 2
IMG_In2=imread('2.tif');
IMG_In2=imresize(IMG_In2,[300 300]);
figure(1);
subplot(1,2,1);imshow(IMG_In1);title('tasvire vorudi 1');
subplot(1,2,2);imshow(IMG_In2);title('tasvire vorudi 2');

%damane tasvire 1
i=sqrt(-1);
B1=fft2(IMG_In1);
Da1=sqrt(real(B1).^2+imag(B1).^2);
figure(2)
subplot(1,2,1);imshow(uint8(Da1));title('damane tasvire 1');
%phase tasvire 1
%Faz1=atan(imag(B1)./real(B1));
Faz1=angle(B1);
figure(2);
subplot(1,2,2);imshow(Faz1);title('phase tasvire 1');

%damane tasvire 2
B2=fft2(IMG_In2);
Da2=sqrt(real(B2).^2+imag(B2).^2);
figure(3);
subplot(1,2,1);imshow(uint8(Da2));title('damane tasvire 2');
%phase tasvire 2
%Faz2=atan(imag(B2)./real(B2));
Faz2=angle(B2);
figure(3);
subplot(1,2,2);imshow(Faz2);title('phase tasvire 2');

%jabejaei damane va faze 2 tasvire vorudi
Img_Out1=Da1.*exp(i*Faz2);
Img_Out2=Da2.*exp(i*Faz1);

%tarsime tasavire khoruji
figure(4);
subplot(1,2,1);imshow(uint8(ifft2(Img_Out1)));title('tasvire khoruji 1:damane1,faze2');
subplot(1,2,2);imshow(uint8(ifft2(Img_Out2)));title('tasvire khoruji 2:damane2,faze1');

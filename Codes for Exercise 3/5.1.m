%in barnamei baraye IDEAL LOWPASS filter tasvir ast,
%BARAYE EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID VA MEGHDAR SHOAE D0 RA BEDAHID.
clc;
clear all;
close all;
%tasvire vorudi
Img_In=imread('5.tif');  
[M,N]=size(Img_In); 
F=fft2(double(Img_In));

%ideal filter
D0=input('shoaae D0 ra vared konid: ');
X=0:(M-1);
Y=0:(N-1);
xx=find(X>M/2);
X(xx)=X(xx)-M;
yy=find(Y>N/2);
Y(yy)=Y(yy)-N;
[v,u]=meshgrid(Y,X);
D=sqrt(u.^2+v.^2);
%lowpass
E=double(D<=D0);       
ID=E.*F;               
ID1=real(ifft2(double(ID)));

%tarsime tasavir
figure(1);
subplot(1,2,1); imshow(Img_In);title('tasvire vorudi');
subplot(1,2,2);imshow(abs(ID1),[0 255]);title(['tasvire khoruji Ideal lowpass filter ba D0 = ' num2str(D0)]); % Displaying input and output image
figure(2);
mesh(X,Y,E);
   
  
   
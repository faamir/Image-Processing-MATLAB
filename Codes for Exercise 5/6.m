%in barnamei baraye LABE YABI BORDARI ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img_in=imread('4.tif');
figure;
imshow(Img_in);title('tasvire vorudi');
T=1;
S=fspecial('sobel');
V=S';
r_x=imfilter(double(Img_in(:,:,1) ) ,S,'replicate' );
r_y=imfilter(double(Img_in(:,:,1) ),V,'replicate' );
g_x=imfilter(double(Img_in(:,:,2) ),S,'replicate' );
g_y=imfilter( double(Img_in(:,:,2) ),V,'replicate' );
b_x=imfilter(double(Img_in(:,:,3) ),S,'replicate' );
b_y=imfilter(double(Img_in(:,:,3) ),V,'replicate' );
gxx=r_x.^2+g_x.^2+b_x.^2;
gyy=r_y.^2+g_y.^2+b_y.^2;
gxy=r_x.*r_y+g_x.*g_y+b_x.*b_y;
M=1/2*(atan(2*gxy./(gxx-gyy+eps)));
F1=1/2*((gxx+gyy)+(gxx-gyy).*cos(2*M)+2*gxy.*sin(2*M)  );
M=pi/2+M;
F2=1/2*((gxx+gyy)+(gxx-gyy).*cos(2*M)+2*gxy.*sin(2*M)  );
F1=sqrt(F1);
F2=sqrt(F2);
FF=mat2gray(max(F1,F2));
r_g=sqrt(r_x.^2+r_y.^2);
g_g=sqrt(g_x.^2+g_y.^2);
b_g=sqrt(b_x.^2+b_y.^2);
Img_out=mat2gray(r_g+g_g+b_g);
if nargin==2
    FF=(FF>T).*FF;
    Img_out=(Img_out>T).*Img_out;
end

figure;
imshow(Img_out);title('tasvire khoruji Labe yabi');
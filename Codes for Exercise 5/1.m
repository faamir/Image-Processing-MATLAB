%in barnamei baraye SLICING(Intensity) ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img_in=imread('1.tif');
[X,Y,Z]=size(Img_in);
for i=1:1:X
    for j=1:1:Y
        if (Img_in(i,j)>= 0) && (Img_in(i,j)< 20)
            t(i,j,1)=0;
            t(i,j,2)=0;
            t(i,j,3)=0;
        elseif (Img_in(i,j)>= 20) && (Img_in(i,j)< 65)
            t(i,j,1)=12;
            t(i,j,2)=56;
            t(i,j,3)=255;       
        elseif (Img_in(i,j)>= 65) && (Img_in(i,j)< 85)
            t(i,j,1)=223;
            t(i,j,2)=198;
            t(i,j,3)=167;
         elseif (Img_in(i,j)>= 85) && (Img_in(i,j)< 110)
            t(i,j,1)=0;
            t(i,j,2)=120;
            t(i,j,3)=150;
        elseif (Img_in(i,j)>= 110) && (Img_in(i,j)< 126)
            t(i,j,1)=146;
            t(i,j,2)=3;
            t(i,j,3)=42;
        elseif (Img_in(i,j)>= 126) && (Img_in(i,j)< 140)
            t(i,j,1)=0;
            t(i,j,2)=3;
            t(i,j,3)=78;
        elseif (Img_in(i,j)>= 140) && (Img_in(i,j)< 160)
            t(i,j,1)=20;
            t(i,j,2)=90;
            t(i,j,3)=25;
        elseif (Img_in(i,j)>= 160) && (Img_in(i,j)< 180)
            t(i,j,1)=210;
            t(i,j,2)=155;
            t(i,j,3)=79;        
        elseif (Img_in(i,j)>= 180) && (Img_in(i,j)< 210)
            t(i,j,1)=126;
            t(i,j,2)=0;
            t(i,j,3)=67;        
        elseif (Img_in(i,j)>= 210) && (Img_in(i,j)< 255)
            t(i,j,1)=255;
            t(i,j,2)=0;
            t(i,j,3)=0;
        end
    end
end
t=t/255;

figure;
imshow(Img_in);title('tasvire vorudi');
figure;
imshow(t);title('tasvire khoruji intensity slicing');
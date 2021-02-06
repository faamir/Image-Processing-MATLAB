%in barnamei baraye HSI SHARPENING ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc
clear all;
close all;
load mydata
Img_in=imread('4.tif');
Img_in = rgb2hsv(Img_in);

Img_in=im2double(Img_in);
H=Img_in(:,:,1);
S=Img_in(:,:,2);
I=Img_in(:,:,3);
[m n]=size(I);
for i=1:m
    for j=1:n
        x1=i+1;
        x2=i-1;
        y1=j-1;
        y2=j+1;
        if(x2<1)
            x2=i;
        elseif (x1>m)
            x1=i;
        end
        if(y1<1)
            y1=j;
        elseif (y2>n)
            y2=j;
        end
        
        IT(i,j)=-4*I(i,j)+ 1*(I(i,y1)+I(i,y2)+I(x1,j)+I(x2,j));
       end
end
H=Img_in(:,:,1);
S=Img_in(:,:,2);
I=Img_in(:,:,3);
T(:,:,1)=H;
T(:,:,2)=S;
T(:,:,3)=I-IT;

figure;
imshow(hsv2rgb(Img_in)),title('tasvire vorudi');
figure, imshow(hsv2rgb(T)),title('tasvire khoruji sharpening ba HSI');
figure;
imshow(T2-T1);title('tasvire ekhtelafe sharpening be raveshe HSI va RGB');

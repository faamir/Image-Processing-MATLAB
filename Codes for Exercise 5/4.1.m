%in barnamei baraye RGB SHARPENING ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc
clear all;
close all;
Img_in=imread('4.tif');
Img_in=im2double(Img_in);
R=Img_in(:,:,1);
G=Img_in(:,:,2);
B=Img_in(:,:,3);
[m n]=size(R);
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
        R2(i,j)=-4*R(i,j)+ 1*(R(i,y1)+R(i,y2)+R(x1,j)+R(x2,j));
        G2(i,j)=-4*G(i,j)+ 1*(G(i,y1)+G(i,y2)+G(x1,j)+G(x2,j));
        B2(i,j)=-4*B(i,j)+ 1*(B(i,y1)+B(i,y2)+B(x1,j)+B(x2,j));
       end
end
R2=R-R2;
G2=G-G2;
B2=B-B2;
Img_out=cat(3,R2,G2,B2);

imshow(Img_in),title('tasvire vorudi');
figure, imshow(Img_out),title('tasvire khoruji ba sharpening RGB');
%in barnamei baraye Median Filter ast.BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID .
clc;
clear all;
close all;
%tasvire vorudi
IMG_IN=imread('cameraman.tif');
n=3;
%noise salt % pepper
Darsad = 10;
[d1 d2]=size(IMG_IN);
ER=round(d1*Darsad/100.0);
AR=round(d2*Darsad/100.0);
for I=1:ER,
    for J=1:AR,
        nn=round(rand(1)*(d2-1))+1;
        mm=round(rand(1)*(d1-1))+1;
        ff=round(rand(1)*255);
        if ff>128
            IMG_IN(mm,nn)=255;
        else
            IMG_IN(mm,nn)=1;
        end
    end
end
%emal ba mask
for i=1:d2
    for j=1:d1
        if(i==1 || j==1 || i==d2 ||j==d1)
            IMAG_O(j,i)=IMG_IN(j,i);
        else
            for l= 1:n
                for k=1:n
                    Mask(l+(k-1)*3)=IMG_IN(j+l-2,i+k-2);
                end
            end
            for l=1:(n*n)
                for k=2:(n*n)
                    if (Mask(l)>Mask(k))
                        temp=Mask(k);
                        Mask(k)=Mask(l);
                        Mask(l)=temp;
                    end
                end
            end
            IMAG_O(j,i)=Mask(5);
        end
    end
end
%tarsime tasavir
figure;
subplot(1,2,1);imshow(IMG_IN);title('tasvire voruid ba noise salt & pepper');
subplot(1,2,2);imshow(IMAG_O);title('tasvire khoruji ba Median Filter');
                
                
                    


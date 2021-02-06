%in barnamei baraye Median Filter ast.BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID VA SIZE MASK BARAYE FILTER RA BEDAHID.
clc;
clear all;
close all;
%tasvire vorudi
IMG_IN=imread('cameraman.tif');
figure(1);imshow(IMG_IN);title('tasvire vorudi');
%tasvire alude shode be noise salt & pepper
IMG_Noise=imnoise(IMG_IN,'salt & pepper',0.1);
L=IMG_Noise;
figure(2);imshow(L);title('tasvire alude shode ba noise salt & pepper 0.1');
[d1,d2]=size(IMG_IN);
nn=0;
%mask
x=input('size mask: ');
y=x;
if (mod(x,2)~=0 && mod(y,2)~=0)
    for z1=1:d1-x+1
        for z2=1:d2-y+1
            L1 = z1;L2=z1+x-1;L3 = z2;L4 =z2+y-1;
            IMG_C = IMG_Noise(L1:L2, L3:L4);
            nn=sort(reshape(IMG_C,1,x*y),'ascend');
            t=nn((x*y+1)/2);
            IMG_Noise(z1-1+(x+1)/2,z2-1+(y+1)/2)=t;
        end
    end
    figure;imshow(IMG_Noise);title(['tasvire khoruji Median filter ba mask : ' num2str(x)]);
    
    

end

%in barnamei baraye ARITHMETIC MEAN FILTER ast.BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
clc;
clear all;
close all;
IMG_IN=imread('2.tif');
figure(1);imshow(IMG_IN);title('tasvire vorudi');
IMG_Noise1=imnoise(IMG_IN,'salt & pepper');
IMG_Noise=imnoise(IMG_Noise1,'gaussian');
[m,n]=size(IMG_Noise);
figure(2);imshow(uint8(IMG_Noise));title('tasvire vorudi ba noise salt & pepper va gaussian');
Mask=3;
nn=ones(Mask);
[p,q]=size(nn);
bb=1:p;
cc=round(median(bb));
IM=zeros(m+2*(cc-1),n+2*(cc-1));

for i=cc:(m+(cc-1))
    for j=cc:(n+(cc-1))
        IM(i,j)=IMG_Noise(i-(cc-1),j-(cc-1));
    end
end
JAM=0;
cc=0;
dd=0;
for i=1:m
    for j=1:n
        for k=1:p
            for l=1:q 
                JAM= JAM+IM(i+cc,j+dd)*nn(k,l);
                dd=dd+1;
            end
            dd=0;
            cc=cc+1;
        end
        cc=0;
        IMG_OUT(i,j)=(1/(p*q))*(JAM);
        JAM=0;
    end
end
figure(3);imshow(uint8(IMG_OUT));title(['tasvire khoruji Arithmetic averaging filter ba mask: ',num2str(Mask)]);

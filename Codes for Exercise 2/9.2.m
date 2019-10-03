%in barnamei baraye AVERAGING FILTER(Ignore Boarders) ast.BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
clc;
close all;
clear all;
%tasvire vorudi
IMG_IN=imread('9.tif'); 
n=3;
IMG_IN=IMG_IN;
figure,imshow(IMG_IN);
title('tasvire vorudi');
% tasvire vorudi ba noise gausian
IMG_Noise=IMG_IN;
%IMG_Noise=imnoise(IMG_IN,'gaussian',0,0.1);
%figure,imshow(IMG_Noise);title('tasvire alude shode be noise gausian');    
%tasvire vorudi ba noise salt & pepper
% IMG_Noise=imnoise(IMG_IN,'salt & pepper');  
% figure;imshow(IMG_Noise);title('tasvire vorudi ba noise salt & pepper');
%ijade mask
Mask=(1/9)*ones(3,3);   
    
    %size araye ha
    [m1, n1] = size(IMG_Noise);
    [m2, n2] = size(Mask);
    
    
    % convolution
    CON = zeros( m1+m2-1, n1+n2-1 );
    for i = 1:m2
        for j = 1:n2
            Rr = i;
            Rr2 = Rr + m1 - 1;
            CON1 = j;
            CON2 = CON1 + n1 - 1;
            CON(Rr:Rr2,CON1:CON2) = CON(Rr:Rr2,CON1:CON2) + Mask(i,j) * double(IMG_Noise);
        end
    end
    
        Rr = floor(m2/2) + 1;
        Rr2 = Rr + m1 - 1;
        CON1 = floor(n2/2) + 1;
        CON2 = CON1 + n1 - 1;
        CON = CON(Rr:Rr2, CON1:CON2);
    
figure;
imshow(uint8(CON));title('tasvire khoruji ba Averaging Filter');
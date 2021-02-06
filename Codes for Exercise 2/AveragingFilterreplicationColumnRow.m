%in barnamei baraye AVERAGING FILTER(replication column/row) ast.BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID
clc;
clear al;
close all;
%tasvire vorudi
IMG_IN=imread('9.tif');
%mask ha
MASK_3=1/(3.^2)*ones(3);
MASK_3_G=imfilter(IMG_IN,MASK_3,'conv','replicate','same');
MASK_5=1/(5.^2)*ones(5);
MASK_5_G=imfilter(IMG_IN,MASK_5,'conv','replicate','same');
MASK_9=1/(9.^2)*ones(9);
MASK_9_G=imfilter(IMG_IN,MASK_9,'conv','replicate','same');
MASK_15=1/(15.^2)*ones(15);
MASK_15_G=imfilter(IMG_IN,MASK_15,'conv','replicate','same');
MASK_35=1/(35.^2)*ones(35);
MASK_35_G=imfilter(IMG_IN,MASK_35,'conv','replicate','same');
%tarsime tasavir
figure(1);
imshow(MASK_3_G);title('tasvire khoruji Averaging filter ba mask 3');
figure(2);
imshow(MASK_5_G);title('tasvire khoruji Averaging filter ba mask 5');
figure(3);
imshow(MASK_9_G);title('tasvire khoruji Averaging filter ba mask 9');
figure(4);
imshow(MASK_15_G);title('tasvire khoruji Averaging filter ba mask 15');
figure(5);
imshow(MASK_35_G);title('tasvire khoruji Averaging filter ba mask 35');


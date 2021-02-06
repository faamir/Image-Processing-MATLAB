%in barnamei baraye PRUNING bad az THINNING ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img = imread('10.jpg');
hsv = rgb2hsv(imcomplement(Img));
Img1 = hsv(:,:,3);

%threshold
Img2 = im2bw(Img1, 0.92);
Img2=imresize(Img2,[400 400]);
figure;imshow(Img2);title('tasvire vorudi');
Img3 = bwmorph(Img2, 'thin',Inf);
Img4 = bwmorph(Img3, 'spur', 30);
%hazfe joziat
Img5 = bwareaopen(Img4, 5);
%dilation
Img6 = imdilate(Img5, strel('square',2*3+1));
%tarsim
figure;
imshow(Img3);title('tasvire Thinning');
figure;
imshow(Img4);title('tasvire khoruji Prunning');
figure;
imshow(Img6);title('tasvire khouji pas az dilate');

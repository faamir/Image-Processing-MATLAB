%in barnamei baraye safhat boreshe biti(Bit Plane) ast,tasvire vorudi be 8
%safhe bit plane tabdil mishavad.BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
IMAGE = imread('3.tif');
IMAGE_7 = IMAGE;
IMAGE_6 = IMAGE;
IMAGE_5 = IMAGE;
IMAGE_4 = IMAGE;
IMAGE_3 = IMAGE;
IMAGE_2 = IMAGE;
IMAGE_1 = IMAGE;
IMAGE_0 = IMAGE;
%tabdil be safehate bit plane
IMAGE_7 = double(bitand(IMAGE,128));
IMAGE_6 = double(bitand(IMAGE,64));
IMAGE_5 = double(bitand(IMAGE,32));
IMAGE_4 = double(bitand(IMAGE,16));
IMAGE_3 = double(bitand(IMAGE,8));
IMAGE_2 = double(bitand(IMAGE,4));
IMAGE_1 = double(bitand(IMAGE,2));
IMAGE_0 = double(bitand(IMAGE,1));
%jame 5 tasvire ba arzesh baraye bazsazi tasvire avalie
M=IMAGE_7+IMAGE_6+IMAGE_5+IMAGE_4+IMAGE_3;
IMAGE_PLUS = [M - min(M(:))] ./ max(M(:) - min(M(:)));
%shekl ha
figure(1);
subplot(4,2,8); imshow(IMAGE_7); title('B= 7:MSB');
subplot(4,2,7); imshow(IMAGE_6); title('B= 6');
subplot(4,2,6); imshow(IMAGE_5); title('B= 5');
subplot(4,2,5); imshow(IMAGE_4); title('B= 4');
subplot(4,2,4); imshow(IMAGE_3); title('B= 3');
subplot(4,2,3); imshow(IMAGE_2); title('B= 2');
subplot(4,2,2); imshow(IMAGE_1); title('B= 1');
subplot(4,2,1); imshow(IMAGE_0); title('B= 0:LSB');
figure(2);
subplot(2,1,1); imshow(IMAGE); title('tasvire vorudi');
subplot(2,1,2); imshow(IMAGE_PLUS);title('tasvire khoruji ba jame 5 safhe bit ba arzesh ');

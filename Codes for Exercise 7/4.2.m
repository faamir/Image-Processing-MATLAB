%in barnamei baraye GLOBAL THRESHOLDING ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img=imread('4.tif');
Img=im2double(Img);
out=0.5*(min(Img(:))+max(Img(:)));
dd=false;
while ~dd
    rr=Img>=out;
    m=0.5*(mean(Img(rr))+mean(Img(~rr)));
    dd=abs(out-m)<0.1;
    out=m;
end
Img_out=im2bw(Img,out);
figure,imshow(Img),title('tasvire vorudi');
figure,imshow(Img_out),title('tasvire khoruji Global Thresholding');

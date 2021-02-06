%in barnamei baraye WATERSHED ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img=imread('7.tif');
bi=im2bw(Img,graythresh(Img));
bic=~bi;
dd=bwdist(bic);
W=watershed(-dd);
w=W==0;
rImg=bi&~w;
figure,imshow(Img),title('tasvire vorudi');
h=fspecial('sobel');
Imgd=im2double(Img);
jazr=sqrt(imfilter(Imgd,h,'replicate').^2+imfilter(Imgd,h','replicate').^2);
mor=imclose(imopen(jazr,ones(3,3)),ones(3,3));
Wd=watershed(mor);
wg=Wd==0;
tg=Img;
tg(wg)=255;
hj=imextendedmin(Img,20);
Lhj=watershed(bwdist(hj));
hk=Lhj==0;
mm=imimposemin(jazr,hj|hk);
wm=watershed(mm);
figure,imshow(mm),title('gradian tasvire vorudi');
out=Img;
out(wm==0)=255;
figure,imshow(out),title('tasvire khoruji Watershed');

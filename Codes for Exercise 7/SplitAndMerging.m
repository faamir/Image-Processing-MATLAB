%in barnamei baraye SPLIT & MERGING ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img=imread('7.tif');
g=spme(Img,0.1,@pish); 
gg=zeros(size(g));
g3=zeros(size(g));
[r c]=find(g == 0);
 
for i=1:length(r)
 
gg(r(i),c(i))= 1;
 
end
  
L=graythresh(Img);
vy=uint8(gg).*Img;
v=im2bw(vy,L);
y=Img; 
Imgc(:,:,1) = Img; 
Imgc(:,:,2)= Img; 
Imgc(:,:,3)= Img; 
y(v>0)=220;Imgc(:,:,1)=y;
y(v>0)=0;Imgc(:,:,2)=y;
y(v>0)=0;Imgc(:,:,3)=y;
figure(1);imshow(Img);title('tasvire vorudi');
figure(2);imshow(Imgc(:,:,1));title('tasvire khoruji Split & Merging');

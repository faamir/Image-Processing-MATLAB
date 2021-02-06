%in barnamei baraye OPENING & CLOSING ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img=imread('4.2.jpg');
Img=im2bw(Img);
figure(1);subplot(3,2,1);imshow(Img);title('tasvire vorudi');
%eleman sakhtari
%B=getnhood(strel('arbitrary',[1 1 1;1 1 1;1 1 1]));
B=getnhood(strel('disk',20));
%erosion
x=floor(size(B,1)/2);
y=floor(size(B,2)/2);
Pad=padarray(Img,[x y],1);
V=false(size(Img));
for i=1:size(Pad,1)-(2*x)
    for j=1:size(Pad,2)-(2*y)
       
        T=Pad(i:i+(2*x),j:j+(2*y));
       
        V(i,j)=min(min(T-B));
      
    end
end
figure(1);subplot(3,2,2);imshow(~V);title('tasvire khoruji Erosion');
%opening
x1=floor(size(B,1)/2);
y1=floor(size(B,2)/2);
Pad1=padarray(~V,[x1 y1],1);
V1=false(size(~V));
for i1=1:size(Pad1,1)-(2*x1)
    for j1=1:size(Pad1,2)-(2*y1)
       
        T1=Pad1(i1:i1+(2*x1),j1:j1+(2*y1));
       
        V1(i1,j1)=max(max(T1&B));
      
    end
end
figure(1);subplot(3,2,3);imshow(V1);title('tasvire khoruji Opening');
se=strel('disk',20);
ee=imdilate(V1,se);
figure(1);subplot(3,2,4);imshow(ee);title('dilate e opening');
ff=imclose(V1,se);
figure(1);subplot(3,2,5);imshow(ff);title('close e opening');

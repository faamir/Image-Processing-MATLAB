%in barnamei baraye THINNING ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img = imread('8.jpg');
figure;imshow(Img);title('tasvire vorudi');
I = Img;
%eleman sakhtari
B=ones(3,3);
op=imopen(I,B);
cl=imclose(op,B);
D=bwdist(~cl);
[m n]=size(D);
M=zeros(m,n);
for i=2:m-2
for j=2:n-2
if((D(i,j)>D(i+1,j))&&(D(i,j)>D(i-1,j)))
M(i,j)=D(i,j);
elseif((D(i,j)>D(i,j+1))&&(D(i,j)>D(i,j-1)))
M(i,j)=D(i,j);
elseif((D(i,j)>D(i-1,j))&&(D(i,j)==D(i+1,j))&&(D(i+1,j)>D(i+2,j)))
M(i,j)=D(i,j);
elseif((D(i,j)>D(i,j-1))&&(D(i,j)==D(i,j+1))&&(D(i,j+1)>D(i,j+2)))
M(i,j)=D(i,j);
end
end
end
%tarsim
figure
imshow(M,[]);title('tasvire khoruji Thinning');

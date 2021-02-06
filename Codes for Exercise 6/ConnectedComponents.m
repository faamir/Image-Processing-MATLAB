%in barnamei baraye CONNECTED COMPONENTS ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img=imread('7.png');
Img=im2bw(Img);
figure;imshow(Img);title('tasvire vorudi');
%eleman sakhtari
B=strel('square',3);
V=Img;
ff=find(V==1);
ff=ff(1);
LB=zeros([size(V,1) size(V,2)]);
N=0;

while (~isempty(ff))
    N=N+1;%label gozari
    ff=ff(1);
X=false([size(V,1) size(V,2)]);
X(ff)=1;

Y=V&imdilate(X,B);
while (~isequal(X,Y))
    X=Y;
    Y=V&imdilate(X,B);
end

ja=find(Y==1);

V(ja)=0;
%Label the components
LB(ja)=N;

ff=find(V==1);

end

mm=zeros([size(V,1) size(V,2)]);
ee=find(LB==1);
mm(ee)=1;
figure,imshow(mm);title('lebel');
%extraction
ee=find(LB==2|LB==3|LB==6|LB==7|LB==9);
mm1=zeros([size(V,1) size(V,2)]);
mm1(ee)=1; 
%rang
rang=zeros([size(LB,1) size(LB,2) 3]);
R=zeros([size(LB,1) size(LB,2)]);
G=zeros([size(LB,1) size(LB,2)]);
B=zeros([size(LB,1) size(LB,2)]);
bn=59;
bs=230;
bg=135;
for i=1:N
    ja=find(LB==i);
    R(ja)=mod(i,2)*bs; 
    G(ja)=mod(i,5)*bn; 
    B(ja)=mod(i,3)*bg;
end
rang(:,:,1)=R;
rang(:,:,2)=G;
rang(:,:,3)=B;
rang=uint8(rang);
figure,imshow(rang);title('tasvire khoruji connected component');

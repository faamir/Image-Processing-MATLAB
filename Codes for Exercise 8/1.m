%in barnamei baraye CHAIN CODE,SHAPE NUMBER ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
%boundary extraction
Img=imread('circles.png');
figure,imshow(Img);title('tasvire vorudi');
%eleman sakhtari
B=getnhood(strel('arbitrary',[1 1 1;1 1 1;1 1 1]));
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
%boundary extraction
IMG=Img-V;
IMG=~IMG;
figure,imshow(IMG);title('tasvire khoruji Boundary Extarction');
% hamsayegi 8taei chain code
n=[0 1;-1 1;-1 0;-1 -1;0 -1;1 -1;1 0;1 1];
fg=1;
ChainCode=[];
[M N]=find(IMG==1);
M=min(M);
imM=IMG(M,:);
N=min(find(imM==1));
point_shoru=[M N];
direc=7;
%loop
while fg==1;
   tt=zeros(1,8);
   direcjadid=mod(direc+7-mod(direc,2),8);
   for i=0:7;
      j=mod(direcjadid+i,8)+1;
      tt(i+1)=IMG(M+n(j,1),N+n(j,2));
   end;
   d=min(find(tt==1));
   direc=mod(direcjadid+d-1,8);
   ChainCode=[ChainCode,direc];
   M=M+n(direc+1,1);
   N=N+n(direc+1,2);
   if M==point_shoru(1)&& N==point_shoru(2);
      fg=0;
   end;
end;

%first difference
shift = circshift(ChainCode, [0, -1]); % Shift 
dta = shift - ChainCode; 
fd = dta; 
L = find(dta < 0); 
FisrtDifference(L) = fd(L) + 8; 

%shape number
min_x_num=find(FisrtDifference==min(FisrtDifference));
Shape_number=[FisrtDifference(min_x_num(1):end),FisrtDifference(1:min_x_num(1)-1)];
 
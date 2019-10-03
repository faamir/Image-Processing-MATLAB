%%in barnamei baraye ADAPTIVE LOCAL FILTER ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc
clear all;
close all;
Img_in=imread('2.tif');
Size=size(Img_in,1)*size(Img_in,2);
Img_in = imnoise(Img_in,'gaussian',0,0.005);
figure,imshow(Img_in); title('tasvire vorudi ba Gaussian noise');
Img_in= double(Img_in);
%MASK
m=5;
n=5;
Pad=padarray(Img_in,[round(m/2),round(n/2)]);
VAR=zeros([size(Img_in,1) size(Img_in,2)]);
MEAN=zeros([size(Img_in,1) size(Img_in,2)]);
T=zeros([size(Img_in,1) size(Img_in,2)]);
Img_out=zeros([size(Img_in,1) size(Img_in,2)]);

for i=1:size(Pad,1)-m-1
    for j=1:size(Pad,2)-n-1
        T=Pad(i:i+(m-1),j:j+(n-1));
        t=reshape(T,[1,(m*n)]);           
        MEAN(i,j)=mean(t);
        VAR(i,j)=mean(t.^2)-mean(t).^2;
    end
end

Var_noise=sum(VAR(:))/Size;
 VAR=max(VAR,Var_noise);     
 Img_out=Var_noise./VAR;
 Img_out=Img_out.*(Img_in-MEAN);
 Img_out=Img_in-Img_out;
 Img_out=uint8(Img_out);
figure,imshow(Img_out);title('tasvire khoruji ba Adaptive local mean filter');
%%in barnamei baraye MIDPOINT FILTER ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc
clear all;
close all;
Img_in=imread('2.tif');
Img_in=imnoise(Img_in,'salt & pepper',0.01);
%Img_in=imnoise(Img_in,'gaussian');
figure(1);
imshow(Img_in),title('tasvire vorudi ba noise salt & pepper');
[m n]=size(Img_in);
S=ones(3,3)/9;
[M N]=size(S);

M=(M-1)/2;
N=(N-1)/2;
Img_out=Img_in;
for i=M+1:m-M
    for j=N+1:n-N
        S1=zeros(3,3);
        for k=-M: M
            for l=-N: N
                S1(M+1-k,N+1-l)=Img_in(i-k,j-l);
            end
        end
            Mp=S1(: );
            Mp=(min(Mp)+max(Mp))/2;
            Img_out(i,j)=Mp;
    end
end
figure(2);
imshow(uint8(Img_out)),title('tasvire khoruji Midpoint filter');
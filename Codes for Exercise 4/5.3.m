%%in barnamei baraye ALPHA-TRIMMED FILTER ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
close all;
clear all;
Img_in=imread('2.tif');
figure,imshow(Img_in);title('tasvire vorudi');
Img_in=imnoise(Img_in,'salt & pepper');
Img_in=imnoise(Img_in,'gaussian');
Img_in=im2double(Img_in);
%Mask
SIZE=2;
% alpha_trimmed 
d=6;
figure,imshow(Img_in);title('tasvire vorudi ba noise salt&pepper va gaussian');
[M N]=size(Img_in);
t=[];
h=0;
b=[];
 
for i=1:M;
    for j=1:N;
        for m=-SIZE:SIZE;
            for n=-SIZE:SIZE;
                if (i+m>0 && i+m<M && j+n>0 && j+n<N &&SIZE+m>0 && SIZE+m<M && SIZE+n>0 && SIZE+n<N)      % To keep indices in limit
                   
                    t=[t Img_in(i+m,j+n)];
                                    
                end
            end
        end
         
        t=sort(t);
        L=length(t);
        for k=((d/2)-1):(L-(d/2))
            b=[b t(k)];
        end
        b=sum(b);
        Img_out(i,j)=(b) / (15-d);
        
        b=[];
        t=[];
        
    end
end

figure,imshow(Img_out);title(['tasvire khoruji Alpha-trimmed mean filter ba d=' num2str(d)]);
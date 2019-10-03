%%in barnamei baraye CONTRAHARMONIC FILTER ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 

clear all; close all; clc;
Img_in = imread('2.tif');
Img_in = imnoise(Img_in,'salt & pepper',0.01);
Img_in = im2double(Img_in);
subplot(1,2,1),imshow(Img_in),title('tasvire vorudi ba salt & pepper noise');
[m n]=size(Img_in);
S=2;
Q=0.1;
for i = 1:m
    for j = 1:n
        C=0; makhraj=0; surat=0;
            for M = i-S:i+S
                for N = j-S:j+S
                    if ((M>0 && N >0) && (M<m && N<n))
                        C = C+1;
                        makhraj=makhraj+(Img_in(M,N)^Q);
                        surat=surat+(Img_in(M,N)^(Q+1));
                    end
                end
            end
                        Img_out(i,j)=surat/makhraj;
    end
end
subplot(1,2,2),imshow(Img_out),title('tasvire khoruji Cantraharmonic mean filter');
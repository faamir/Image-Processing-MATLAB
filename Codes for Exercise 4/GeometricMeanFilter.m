%%in barnamei baraye GEOMETRIC MEAN FILTER ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clear all; close all; clc;
Img_in = imread('2.tif');
Img_in = im2double(Img_in);
Mean= 0;
Var = 0.01;
Img_noise = Img_in + sqrt(Var)*randn(size(Img_in)) + Mean;

subplot(1,2,1),imshow(Img_noise),title('tasvire vorudi ba gaussian noise');
[m n]=size(Img_noise);
S=2;
for i = 1:m
    for j = 1:n 
        MN=0; G=1;
            for M = i-S:i+S
                for N = j-S:j+S
                    if ((M > 0 && N > 0) && (M < m && N < n ))
                        MN = MN+1;
                        G=G*Img_noise(M,N);
                    end
                end
            end
                F_hat(i,j)=G^(1/MN);
     end 
end
subplot(1,2,2),imshow(F_hat),title('tasvire khoruji Geometric mean filter');

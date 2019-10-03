%%in barnamei baraye BUTTERWORTH NOTCH REJECT FILTER ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
IMG_In=imread('1.jpg');
FFT = fft2(double(IMG_In));
FFT1=fftshift(FFT);
[M N]=size(FFT);
figure;
imshow(log(1+abs(FFT1)),[]);title('tasvire andaze tabdil fourier tasvire vorudi ba periodic noise');

D0 = 10;
n = 2;
%marakez baraye hazfe filter,adade aval jahate x va adade dovom jahate y
%ast
C = [0 50;-50,0;110 110;-110 110];
no = size(C,1);
H = ones(M, N);
[X,Y] = meshgrid(-(N-1)/2:(N-1)/2, (M-1)/2:-1:-(M-1)/2);
for CI = 1:no
    DD = sqrt((X - C(CI,1)).^2 + (Y - C(CI,2)).^2);
    Butter1 = 1 ./ (1 + ((D0 ./ DD).^(2*n)));
    
    DDConj = sqrt((X + C(CI,1)).^2 + (Y + C(CI,2)).^2);
    Butter2 = 1 ./ (1 + ((D0 ./ DDConj).^(2*n)));
    H = H .* Butter1 .* Butter2;
end
figure;
imshow(H,[]);title('makane emale filter ha ba tavajoh be spike ha');
[X,Y] = meshgrid(-(N-1)/2:(N-1)/2, (M-1)/2:-1:-(M-1)/2);
figure;
surfl(X,Y,H); 
shading interp 
colormap(gray);title('namaye filter');

nn=H.*FFT1;
nn1=ifftshift(nn);
IMG_Out=ifft2(nn1);
figure;
imshow(abs(IMG_Out),[0 255]);title('tasvire khoruji Butterworth notch reject filter');

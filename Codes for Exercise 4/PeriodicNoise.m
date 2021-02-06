%%in barnamei baraye tolide PERIODIC NOISE ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img_in = imread('cameraman.tif');
Img_in = double(Img_in);
FFF=fftshift(fft2(Img_in));
figure;
imshow(log10(FFF),[]);title('tasvire andaze tabdil furier tasvire vorudi');
[M N] = size(Img_in);

Img_in = Img_in;
for i = 1:M
    for j = 1:N
        %tasvire ba noise periodic
        Img_in(i,j) = Img_in(i,j) +4.*(1+sin(2*pi*((i-1)/M)*200))+4.*(1+sin(2*pi*((j-1)/N)*200))+4.*(1+sin(2*pi*((i-1)/M+(j-1)/N)*140))+4.*(1+sin(2*pi*((i-1)/M-(j-1)/N)*140));
    end
end

c = 1; 
GAMA = 2;
F =255*c*(Img_in/255).^GAMA;
Img_in = F;
FFT = fft2(Img_in,2*M-1,2*N-1);
FFT = fftshift(FFT);
G = ones(2*M-1,2*N-1);
D0 = 400; 
n = 4;
W = 20;
for i = 1:2*M-1
    for j =1:2*N-1
        FASELE = ((i-(M+1))^2 + (j-(N+1))^2)^.5;
        if FASELE ~= D0
            G(i,j)= 1/(1 + (FASELE*W/(FASELE^2 - D0^2))^(2*n));
        else
            G(i,j) = 0;
        end
    end
end
Img_out = G.*FFT;
Img_out = ifftshift(Img_out);
Img_out = ifft2(Img_out,2*M-1,2*N-1);
Img_out = real(Img_out(1:M,1:N));
Img_out = uint8(Img_out);
figure;
imshow(Img_out);title('tasvire khoruji ba periodic noise');
F = fft2(double(Img_out));
F1=fftshift(F);
figure;
imshow(log10(F1),[]);title('tasvire andaze tabdil furier tasvire khoruji periodic noise');
%imwrite(Img_out,'111.jpg','jpg');


%in barnamei baraye S(r),S(teta) SPECTRAL APPROACH ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc
clear all;
close all;
Img = imread('5.1.tif');
%Img = imread('5.2.tif');
figure;
imshow(Img); title('tasvire vorudi'); 
%tabdil Fourier
Fourier = ifftshift(fft2(Img));
[M, N] = size(Fourier);
[ux, uy] = meshgrid(([1:N]-(fix(N/2)+1))/(N-mod(N,2)),([1:M]-(fix(M/2)+1))/(M-mod(M,2)));

%tabdil be mokhtasate ghotbi
teta = atan2(uy,ux);
radian = sqrt(ux.^2 + uy.^2);
Fourierr = Fourier .* teta;
radiancoords = linspace(0,sqrt(ux(1,1)^2 + uy(1,1)^2),M);
tetacoords = linspace(0,2*pi,N);
[radiani,tetai] = meshgrid(radiancoords,tetacoords);
[x,y] = pol2cart(tetai,radiani);
Fourierp = interp2(ux,uy,abs(Fourierr),x,y);
figure;
imagesc(Fourierp); title('fourier ghotbi'); 
%sigma S(r)
Fourier1D = sum(Fourierp);
figure;
plot(tetacoords,Fourier1D); title('S(r)'); xlim([0 4]);

%%%%%%%%%%%%%%

%tabdil be mokhtasate ghotbi
Fouriers = Fourier .* radian;
figure;
imagesc(abs(Fouriers)); title('teife ferekansi tasvir');
sradiancoords = linspace(0,sqrt(ux(1,1)^2 + uy(1,1)^2),M);
stetacoords = linspace(0,2*pi,N);
[radiani,tetai] = meshgrid(sradiancoords,stetacoords);
[x,y] = pol2cart(tetai,radiani);
Fourierps = interp2(ux,uy,abs(Fouriers),x,y);
%sigma S(teta)
Fourier1Ds = sum(Fourierps);
figure;
plot(sradiancoords,Fourier1Ds); title('S(teta)'); xlim([0 0.1]);

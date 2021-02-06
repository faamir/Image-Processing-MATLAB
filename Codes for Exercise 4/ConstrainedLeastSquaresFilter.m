%%in barnamei baraye Constrained Least Squares FILTER ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
clc
clear all
close all
Img_in=imread('cameraman.tif');
Img_in=double(Img_in);
[M N]=size(Img_in);
FFT=fftshift(fft2(Img_in,M,N));
C=zeros(M,N);
De = fspecial('motion',40,50);
O = psf2otf(De,[M N]);
H0 =fftshift(O);
H1=imfilter(Img_in,De,'replicate');
figure(1);imshow(H1,[]);title('tasvire vorudi motion blur');
p=[0 -1 0;-1 4 -1;0 -1 0];
P = fftshift(fft2(p,M,N));
r=0.000001 ;

for u=1:M
    for v=1:N
        if abs(H0(u,v))<0.0001 && abs(P(u,v))<0.0001
            H0(u,v)=0.001;
            P(u,v)=0.001;
        end
    end
end
for u = 1:M
    for v = 1:N   
        C(u,v) = H0(u,v)*FFT(u,v)./(abs(H0(u,v))^2+r*(abs(P(u,v)))^2);
    end
end

C=((ifft2(ifftshift(C.*H0))));
figure,imshow(C,[]);title('tasvire khoruji Constrained least squares filtering');

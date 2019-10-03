%in barnamei baraye filter Anti-Aliasing tasvir ast,
%BARAYE EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
%tasvire vorudi
Img_In=imread('2.tif');
F=fft2(Img_In);
[n,m]=cart2pol(real(F),imag(F));
[M,N]=size(Img_In);
[x,y]=meshgrid(1:N,1:M);
%Gaussian
K=100;
N1=N/2;H=M/2;
GN=exp(-1/2*((x-N1).^2+(y-H).^2)/K^2);
GN=GN/max(GN(:));
NN=GN;figure;mesh(NN);
H=NN.*fftshift(m);
H=ifftshift(H);
[x1,x2]=pol2cart(n,H);
i=sqrt(-1);
F2=x1+i*x2;IM=abs(ifft2(F2));
%tasavire khoruji
Img_Re=imresize(Img_In,0.8);
Img_Gn=imresize(IM,0.8);
%tarsime tasavir
figure(1);
imshow(Img_Re,[]);title('tasvire vorudi resize shode bedune anti-aliasing filter');
figure(2);
imshow(Img_Gn,[]);title('tasvire khoruji blur shode taKsote lowpass GNsian(anti-aliasing) K sepas resize shode');


 

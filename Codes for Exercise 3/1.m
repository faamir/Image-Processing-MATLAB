%in barnamei baraye DFT tasvir ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
%tasvire vorudi
Img_In=imread('5.tif');
%Img_In=imread('rice.png');

Img_In=imresize(Img_In,[50,50]);
figure;
subplot(2,2,1);imshow(Img_In);title('tasvire vorudi');
Img_R=imrotate(Img_In,-70 , 'bilinear','crop');
subplot(2,2,2);imshow(Img_R);title('tasvire vorudi charkhesh yafte');
Img_In=double(Img_In);
[n m]=size(Img_In);

%DFT
i=sqrt(-1);
Na=zeros(n,m);
Ca=complex(0,0);
for U=0:n-1
    for V=0:m-1
        for j=0:n-1
            nn=complex(0,0);
            for k=0:m-1
                nn=nn+Img_In(j+1,k+1)*exp((-2*pi*i/m)*V*k);                
            end
            Ca=Ca+nn*exp((-2*pi*i/n)*U*j);
        end
        Na(U+1,V+1)=Ca/n;
        Ca=complex(0,0);
    end
end

subplot(2,2,3);imshow(uint8(abs(Na)));title('DFT tasvir bedune shift');
Img_In=double(Img_R);
i=sqrt(-1);
Na=zeros(n,m);
Ca=complex(0,0);
for U=0:n-1
    for V=0:m-1
        for j=0:n-1
            nn=complex(0,0);
            for k=0:m-1
                nn=nn+Img_In(j+1,k+1)*exp((-2*pi*i/m)*V*k);                
            end
            Ca=Ca+nn*exp((-2*pi*i/n)*U*j);
        end
        Na(U+1,V+1)=Ca/n;
        Ca=complex(0,0);
    end
end
Img_out = abs(fftshift((Na)));

%tarsime tasvire khoruji
subplot(2,2,4);imshow(uint8(abs(Img_out)));title('DFT tasvir ba shift be markaz');

%in barnamei baraye Local Histogram Equalization ast.BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
clc;
close all;
clear all;
%tasvire vorudi
IMAG_IN=imread('6.tif');
figure(1);imshow(IMAG_IN);title('tasvire vorudi');
IMAG_OUT=IMAG_IN;
%size panjere
M=10;
N=10;
Mian=round((M*N)/2);
%peida kardan tedad satr ha va sotun ha baraye laye gozari
in=0;
for i=1:M
    for j=1:N
        in=in+1;
        if(in==Mian)
            PM=i-1;
            PN=j-1;
            break;
        end
    end
end
%laye gozari tasvir ba sefr
NN=padarray(IMAG_IN,[PM,PN]);

for i= 1:size(NN,1)-((PM*2)+1)
    
    for j=1:size(NN,2)-((PN*2)+1)
        CC=zeros(256,1);
        ii=1;
        for x=1:M
            for y=1:N
  %yafrtane araye miani dar panjere        
                if(ii==Mian)
                    ele=NN(i+x-1,j+y-1)+1;
                end
                    pos=NN(i+x-1,j+y-1)+1;
                    CC(pos)=CC(pos)+1;
                   ii=ii+1;
            end
        end
        
        for l=2:256
            CC(l)=CC(l)+CC(l-1);
        end
            IMAG_OUT(i,j)=round(CC(ele)/(M*N)*255);
     end
end
%tarsime shekl ha va histogram ha.
figure(2);
imshow(IMAG_OUT);title('tasvire khoruji bad az local histogram equalization');
figure(3);
subplot(2,1,1); imhist(IMAG_IN);title('histogram tasvire vorudi');
subplot(2,1,2); imhist(IMAG_OUT);title('histogram tasvire khoruji local histogram equalization');

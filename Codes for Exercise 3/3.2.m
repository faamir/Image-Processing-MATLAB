%in barnamei baraye ijade MOIRE PATTERN ast,
%BARAYE EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
clc;
clear all;
close all;
%tolide pattern
x=500;
A=zeros(x,x)+255;
nn=10;
for ii=1:nn:x
    for jj=1:nn:x
        A(ii:ii+nn/2,jj:jj+nn/2)=0;
    end
end

B=imrotate(A,80,'crop');
%zarbe 2 tasvir
C=A.*B;
%tarsime tasavir
figure;
subplot(1,3,1);imshow(A);title('tasvire noghtei');
subplot(1,3,2);imshow(B);title('tasvire noghtei movarab shode');
subplot(1,3,3);imshow(C);title('Moire Pattern');
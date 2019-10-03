%in barnamei baraye FOURIER DESCRIPTOR ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img = imread('circles.png');
%Img=imresize(Img,[128,128]);
%Img =imrotate(Img,30);
%Img= imtranslate(Img,[15, 15]);
bound = bwboundaries(Img);
bound = bound{1};
if mod(size(bound,1), 2) ~= 0
    bound = [bound; bound(end, :)];
end
num = 20;
% extract fourier Descriptor
nn = size(bound, 1);
F = bound(:, 1) + i*bound(:, 2);
Descriptor = fft(F);

%mohasebe a(u)
Au = [Descriptor((1+(nn/2)):end); Descriptor(1:nn/2)];
andaze = size(Au, 1);
if num >= andaze
    Descriptor_mohem = Au;
else
a = (andaze/2 - num/2) + 1;
bound = andaze/2 + num/2;
Descriptor_mohem = Au(a : bound);
end

%mohasebe S(k)
SK=(ifft2(Au))/num;
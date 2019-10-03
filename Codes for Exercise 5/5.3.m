%in barnamei baraye COLOR SEGMENTATION ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img_in =imread('2.tif');
figure(1), imshow(Img_in), title('tasvire vorudi');
%tedad rang baraye nahie bandi
N = 6;
S = false([size(Img_in,1) size(Img_in,2) N]);
load regioncoordinates;
for cc = 1:N
  S(:,:,cc) = roipoly(Img_in,region_coordinates(:,1,cc),region_coordinates(:,2,cc));
end
LI = rgb2lab(Img_in);
x = LI(:,:,2);
y = LI(:,:,3);
cm = zeros([N, 2]);
for cc = 1:N
  cm(cc,1) = mean2(x(S(:,:,cc)));
  cm(cc,2) = mean2(y(S(:,:,cc)));
end
cl = 0:N-1;
x = double(x);
y = double(y);
d = zeros([size(x), N]);
for cc = 1:N
  d(:,:,cc) = ( (x - cm(cc,1)).^2 + (y - cm(cc,2)).^2 ).^0.5;
end
[~, ll] = min(d,[],3);
ll = cl(ll);
clear d;
IL = repmat(ll,[1 1 3]);
Img_out = zeros([size(Img_in), N],'uint8');
for cc = 1:N
  rang = Img_in;
  rang(IL ~= cl(cc)) = 0;
  Img_out(:,:,:,cc) = rang;
end
figure;
imshow(Img_out(:,:,:,2)), title('tasvire khoruji color segmentation');
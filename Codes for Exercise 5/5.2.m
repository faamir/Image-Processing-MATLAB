%in barnamei baraye COLOR SEGMENTATION CITYBLOCK ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img_in = imread('5.tif');
figure
imshow(Img_in), title('tasvire vorudi'); 
CF = makecform('srgb2lab');
L = applycform(Img_in,CF);
S = double(L(:,:,2:3));
nr = size(S,1);
nc = size(S,2);
S = reshape(S,nr*nc,2);
N = 6;
[ci cc] = kmeans(S,N,'distance','cityblock','Replicates',5);                                   
pl = reshape(ci,nr,nc);
figure;
imshow(pl,[]), title('taghsime tasvir be navahi tashkil dahande aan');  
si = cell(1,3);
iml = repmat(pl,[1 1 3]);
for k = 1:N
    rang = Img_in;
    rang(iml ~= k) = 0;
    si{k} = rang;
end

figure;
imshow(si{1}), title('tasvire khoruji 1');
figure;
imshow(si{2}), title('tasvire khoruji 2');
figure;
imshow(si{3}), title('tasvire khoruji 3');
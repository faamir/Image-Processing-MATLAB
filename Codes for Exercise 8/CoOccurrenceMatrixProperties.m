%in barnamei baraye PROPERTIES CO-OCCURRENCE MATRIX ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img=imread('3.2.tif');
%Img=imread('3.1.tif');
%Img=imread('3.3.tif');
figure(1);
imshow(Img);title('tasvire vorudi');
%jahat
x=0;
y=1;
[N,M] = size(Img);
CO = zeros(256,256);
for i=1-min(0,x):N-max(0,x)
for j=1-min(0,y):M-max(0,y)
CO(Img(i+x,j+y)+1,Img(i,j)+1) = CO(Img(i+x,j+y)+1,Img(i,j)+1)+1;
end
end
Co_Occurrence = CO/sum(sum(CO));
%max probabaility
aMaxProb = max(max(Co_Occurrence));
%contrast
aContrast = sum(sum(toeplitz(0:size(Co_Occurrence,1)-1).^2.*Co_Occurrence));
%uniformity
aUniformity = sum(sum(Co_Occurrence.^2));
%entropy
aEntropy = -sum(sum(Co_Occurrence.*log2(Co_Occurrence+eps)));
%correlation
gg=graycomatrix(Img,'offset', [0 1]);
pro='correlation';
aCorrelation = graycoprops(gg, pro);

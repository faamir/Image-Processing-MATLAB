%Barnamei baraye ijade Sotuhe Quantization mokhtalef.dar in barname ba
%dadane har sath level khakestari tasvir dar aan sath Quantize
%mishavad.BARAYE EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID,SEPAS YEK ADAD BARAYE Sathe Quntization VARED
%NAMAEID.
clc;    % 
clear all;  % 
close all;  % 
Img = imread('2.tif');
Level_Quantization = input('Enter LEVEL OF QUANTIZATION:');

[rows columns ] = size(Img);
% Namayeshe tasvire original e Vorudi
subplot(2, 1, 1);
imshow(Img, []);
title('Tasvir e Vorudi');
% Namayesh Fullscreen
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
colorbar
% Quantize kardan
Img_Quantize = uint8(mat2gray(Img)*(Level_Quantization-1));
% Namayeshe Tasvire Quantize shode dar sotuhe mokhtalef
subplot(2, 1, 2);
imshow(Img_Quantize, []);
caption = sprintf('Tasvir e Quantize shode dar Level: %d', Level_Quantization);
title(caption);
% Namayesh Fullscreen
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
colorbar


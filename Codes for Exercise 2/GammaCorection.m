%in barnamei baraye Gamma corection dar tasvir ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID,SEPAS YEK ADAD BARAYE ZARIB Gamma BEDAHID. 
clc;
clear all;
close all;
%tasvire vorudi
IN_IMG = imread('1.1.tif');
%IN_IMG = imread('1.2.tif');

%ijade zarib gamma
n=input('zarib gama:');
OUT_IMG = double(IN_IMG).^n;
OUT_IMG = [OUT_IMG - min(OUT_IMG(:))] ./ max(OUT_IMG(:) - min(OUT_IMG(:)));
%tarsime shekl ha
figure;
subplot(2,1,1);
imshow(IN_IMG); title('tasvire asli');
subplot(2,1,2);
imshow(OUT_IMG);
title(['tasvir bad az tashih ba gamma: ',num2str(n)]);

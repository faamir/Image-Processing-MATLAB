%in barnamei baraye tashihe teke khati tasvir(Linear Piecewise) ast.BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
clc;
clear all;
close all;
%tasvire vorudi
IN_IMG = imread('2.tif');
MIN_O = min(IN_IMG(:));
MAX_O = max(IN_IMG(:));
O = 0:255;
A = zeros(size(O));
A(1:find(A==MIN_O)) = 0;
M = length(O(find(O==MIN_O):find(O==MAX_O)));
A(find(O==MIN_O):find(O==MAX_O)) = 0:255./M:255-255./M;
A(find(O==MAX_O)+1:end) = 255;
OUT_IMG = double(IN_IMG); OUT_IMG = [OUT_IMG - min(OUT_IMG(:))] ./ max(OUT_IMG(:) - min(OUT_IMG(:)));
%tarsime shekl ha
figure(1);
subplot(2,1,1); 
imshow(IN_IMG);
title('tasvire vorudi');
subplot(2,1,2);
imshow(OUT_IMG);
title('linear piecewise');
figure(2);
plot(O,A); axis([0 255 -2 259]);
xlabel('roshanaei pixel dar tasvire vorudi'); ylabel('roshanaei pixel dar tasvire khoruji');

%in barnamei baraye miangin giri az tasavir noisi ba noise gausian miangin0 varianse0.1 ast.BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
%tasvire vorudi
clc;
clear all;
close all;
%tasvire vorudi
IMG_IN = double(imread('7.tif'));
%ezafe kardane noise normal ya gausian ba miangine 0 va varianse 0.1 be
%tasvire vorudi
NOISE = IMG_IN + 20*randn(size(IMG_IN,1), size(IMG_IN,2));
Miangir_8 = zeros(size(IMG_IN,1), size(IMG_IN,2)); Miangir_16 = Miangir_8;
Miangir_64 = Miangir_8; Miangir_128 = Miangir_8;Miangir_256 = Miangir_8;
%miangin giri baraye ba tedade moshakhas ba noise
for i=1:8
Miangir_8 = Miangir_8 + IMG_IN + 20*randn(size(IMG_IN,1), size(IMG_IN,2));
end
for i=1:16
Miangir_16 = Miangir_16 + IMG_IN + 20*randn(size(IMG_IN,1), size(IMG_IN,2));
end
for i=1:64
Miangir_64 = Miangir_64 + IMG_IN + 20*randn(size(IMG_IN,1), size(IMG_IN,2));
end
for i=1:128
Miangir_128 = Miangir_128 + IMG_IN + 20*randn(size(IMG_IN,1), size(IMG_IN,2));
end
for i=1:256
Miangir_256 = Miangir_256 + IMG_IN + 20*randn(size(IMG_IN,1), size(IMG_IN,2));
end
Miangir_8 = Miangir_8/8; Miangir_16 = Miangir_16/16; Miangir_64 = Miangir_64/64; Miangir_128 = Miangir_128/128;Miangir_256 = Miangir_256/256;
IMG_IN = [IMG_IN - min(IMG_IN(:))] ./ max(IMG_IN(:) - min(IMG_IN(:)));
NOISE = [NOISE - min(NOISE(:))] ./ max(NOISE(:) - min(NOISE(:)));
%normalize
Miangir_8 = [Miangir_8 - min(Miangir_8(:))] ./ max(Miangir_8(:) - min(Miangir_8(:)));
Miangir_16 = [Miangir_16 - min(Miangir_16(:))] ./ max(Miangir_16(:) - min(Miangir_16(:)));
Miangir_64 = [Miangir_64 - min(Miangir_64(:))] ./ max(Miangir_64(:) - min(Miangir_64(:)));
Miangir_128 = [Miangir_128 - min(Miangir_128(:))] ./ max(Miangir_128(:) - min(Miangir_128(:)));
Miangir_256 = [Miangir_256 - min(Miangir_256(:))] ./ max(Miangir_256(:) - min(Miangir_256(:)));
%tarsime tasavir
figure(1);
subplot(2,2,1); imshow(IMG_IN); title('tasvire vorudi');
subplot(2,2,2); imshow(NOISE); title('tasvire vorudi 20 bar alude shode ba nosie gaussian miangin 0 varianse 0.1');
subplot(2,2,3); imshow(Miangir_8); title('tasvire khoruji pas az miangin giri 4 tasvire kharaab');
subplot(2,2,4); imshow(Miangir_8); title('tasvire khoruji pas az miangin giri 8 tasvire kharaab');
subplot(2,2,4); imshow(Miangir_16); title('tasvire khoruji pas az miangin giri 16 tasvire kharaab');
figure(2);
subplot(2,2,1); imshow(Miangir_16); title('tasvire khoruji pas az miangin giri 32 tasvire kharaab');
subplot(2,2,2); imshow(Miangir_64); title('tasvire khoruji pas az miangin giri 64 tasvire kharaab');
subplot(2,2,3); imshow(Miangir_128); title('tasvire khoruji pas az miangin giri 128 tasvire kharaab');
subplot(2,2,4); imshow(Miangir_256); title('tasvire khoruji pas az miangin giri 256 tasvire kharaab');

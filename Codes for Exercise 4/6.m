%%in barnamei baraye tolide ADAPTIVE MEDIAN FILTER ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc
clear all
close all;
%tasvire vorudi
Img_in=imread('2.tif');
Img_in=imnoise(Img_in,'salt & pepper',0.25);
Img_in=double(Img_in);
figure(1);
imshow(Img_in,[]);title('tasvire vorudi ba noise salt & pepper 0.25');
S=5;
   
[M, N] = size(Img_in);
g = Img_in;
g(:) = 0;
P = false(size(Img_in));
%filter
for i = 3:2:S
    Z_min = ordfilt2(Img_in, 1, ones(i, i), 'symmetric');
    Z_max = ordfilt2(Img_in, i * i, ones(i, i), 'symmetric');
    Z_med = medfilt2(Img_in, [i i], 'symmetric');
    P2 = (Z_med > Z_min) & (Z_max > Z_med) &~P; 
    Z_2 = (Img_in > Z_min) & (Z_max > Img_in);
    Z_out  = P2 & Z_2;
    Z_outmed = P2 & ~Z_2;
    g(Z_out) = Img_in(Z_out);
    g(Z_outmed) = Z_med(Z_outmed);
    P = P | P2;
        if all(P(:))
            break;
        end

end
g(~P) = Z_med(~P);
%tarsim tasvir
figure(2);
imshow(Z_med,[]);title('tasvire khoruji Adaptive median filter');
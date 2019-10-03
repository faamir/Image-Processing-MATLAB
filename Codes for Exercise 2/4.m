% in barnamei baraye Histogram Equalization ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
clc;
close all;
clear all;

IN_IMG = imread('4.1.tif');
%IN_IMG = imread('4.2.tif');
%IN_IMG = imread('6.tif');
 if(size(IN_IMG,3) > 1)
end;
%tabdile tasvire vorudi
IN_IMG = imresize(IN_IMG,[256 256]);
MAX_O = size(IN_IMG,1);
MAX_A = size(IN_IMG,2);
%histograme tasvir
HST = zeros([1 256]);
M_HIST = zeros([1 256]);
for r=1:MAX_O
    for c=1:MAX_A
        for NN=1:256
            if(IN_IMG(r,c) == NN-1)
                HST(NN) = HST(NN) + 1;
                break;
            end
        end
    end
end

%histograme tajamoei
Meghdar = 0;
for NN=1:256
    Meghdar = Meghdar + HST(NN);
    M_HIST(NN) = Meghdar;
end

Hist_NORMAL = zeros([1 256]);
Min_CD = min(M_HIST);
for NN=1:256
    Hist_NORMAL(NN) = M_HIST(NN) - Min_CD;
    Hist_NORMAL(NN) = Hist_NORMAL(NN) / ( (MAX_O*MAX_A) - Min_CD);
    Hist_NORMAL(NN) = round(Hist_NORMAL(NN) * 255);
end
%tabdil meghdar ha
IMG_Equal = zeros([MAX_O MAX_A]);
for r=1:MAX_O
    for c=1:MAX_A
      
        for NN=1:256
          
            if(IN_IMG(r,c) == (NN-1))
               
                IMAGE_Equalize(r,c) = Hist_NORMAL(NN);
                break;
            end
        end
    end
end
%tarsime tasavir va histogram ha
subplot(2,2,1);
imshow(IN_IMG);
title('Tasvire vorudi');
subplot(2,2,2);
imhist(IN_IMG);
title('Histogram e tasvire vorudi');
subplot(2,2,3);
imshow(uint8(IMAGE_Equalize));
title('tasvire khoruji Histogram equalization');
H=uint8(IMAGE_Equalize);
subplot(2,2,4);
imhist(H);
title('Histogram tasvire khoruji');
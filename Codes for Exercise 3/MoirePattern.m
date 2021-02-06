%in barnamei baraye ijade MOIRE PATTERN ast,
%BARAYE EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all; 
%ijade tasvire rah rah
Ra = 480;
So = 640;
V = (1 : Ra)';
n = 20; 
Da = 0.5; 
ff = 1 - Da; 
SV = Da * ( sin(2 * pi * V / n))/2 + ff;
IMG_1 = repmat(SV, [1, So]);
figure;
subplot(1, 3, 1);imshow(IMG_1, []);title('tasvire rah rah');
%charkheshe tasvire rah rah
IMG_Ro = imrotate(IMG_1, 170, 'crop'); 
subplot(1, 3, 2);imshow(IMG_Ro, []);title('tasvire rah rahe movarab shode');
% zarbe 2 tasvir
IMG_Out = IMG_1 .* double(IMG_Ro);
subplot(1, 3, 3);imshow(IMG_Out, []);title('Moire Pattern');

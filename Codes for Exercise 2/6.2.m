%in barnamei baraye Local Histogram Equalization ast.BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
%tasvire vorudi
IMG_IN=imread('6.tif');
IMG_IN=im2double(IMG_IN);
XX=input('size e panjere : ');
k=input('meghdar sabete k(beyne 0 va 1) : ');
M=mean2(IMG_IN);
N=colfilt(IMG_IN,[XX XX],'sliding',@std);
O=colfilt(IMG_IN,[XX XX],'sliding',@mean);
L=k*M./N;
IMG_OUT=L.*(IMG_IN-O)+O;
figure(1);
imshow(IMG_IN);title('tasvire vorudi');
figure(2);
imshow(IMG_OUT);title('tasvire khoruji Local histogram equalization');


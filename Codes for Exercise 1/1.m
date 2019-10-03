%in Barnmaei baraye taghiire Resolution Tasvir ast.ba Zarib Factor
%Resolution Tasvir ra kam mikonim.Har che zarib factor balatar bashad
%kaheshe resolution e bishtari dar tasvire vorudi etefagh mioftad.BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID,SEPAS YEK ADAD BARAYE ZARIB FACTOR BEDAHID.
clc;
clear all;
close all;
%gereftane tasvir va factore resolution

FAC=input('Enter FACTOR:');
MAP=imread('1.tif');
%gereftane size e tasvir
INPUT_SIZE=size(MAP);
WIDTH=INPUT_SIZE(1,1);
HEIGHT=INPUT_SIZE(1,2);
%tarsim
figure(1);
imshow(MAP);
title(['Tasvir e Vorudi : ',num2str(WIDTH),'x',num2str(HEIGHT)]);

%Nerkhe kahesh ba zaribe FACTOR
for i=0:(WIDTH/FAC)-1
for j=0:(HEIGHT/FAC)-1
out(i+1,j+1)=MAP(FAC*i+1,FAC*j+1);
end
end
OUTPUT_SIZE=size(out);
OUTPUT_WIDTH=OUTPUT_SIZE(1,1);
OUTPUT_HEIGHT=OUTPUT_SIZE(1,2);
%tarsim
figure(2);
imshow(out);
title(['Tasvir e Resize Shode']);

%Taghiir e Shekl
for i=0:OUTPUT_WIDTH-1
for j=0:OUTPUT_HEIGHT-1
for x=0:FAC-1
for y=0:FAC-1
final_out(FAC*i+x+1,FAC*j+y+1)=out(i+1,j+1);
end
end
end
end
%tarsim
figure(3);
imshow(final_out);
OUTPUT_SIZE=size(out);
final_OUTPUT_SIZE=size(final_out);
disp(final_OUTPUT_SIZE);
final_OUTPUT_WIDTH=final_OUTPUT_SIZE(1,1);
final_OUTPUT_HEIGHT=final_OUTPUT_SIZE(1,2);
title(['Bad az Kaheshe e Resolution Fazaei be vasile Zarib FACTOR :',num2str(FAC)]);


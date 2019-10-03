%in barnamei baraye POLYGONAL APPROXIMATION ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
M = gallery('uniformdata',20,1,1);
N = gallery('uniformdata',20,1,10);
plot(M,N,'.')
xlim([0 1])
ylim([0 1])
c = boundary(M,N);
hold on;
plot(M(c),N(c));
threshold=0.1;
j = boundary(M,N,threshold);
hold on;
plot(M(j),N(j));title('tasvire khoruji polygonal approximation');
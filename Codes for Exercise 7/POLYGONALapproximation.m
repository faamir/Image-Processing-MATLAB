%in barnamei baraye POLYGONAL APPROXIMATION ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img = imread('1.jpg');
figure(1);
imshow(Img);title('tasvire vorudi');
BI = im2bw(Img, graythresh(Img));
[M,N] = bwboundaries(BI,'noholes');
figure(2);imshow(label2rgb(N, @jet, [.5 .5 .5]))
hold on
for k = 1:length(M)
    boundary = M{k};
    plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
hold off

close(gcf)
bb = false(15,40);
bb(5:10,10:30) = true;
M = bwboundaries(bb);
boundary = M{1};
figure(3);imshow(bb)
hold on
plot(boundary(:,2), boundary(:,1))
plot(boundary(:,2), boundary(:,1), '*')
hold off
x = [10 30 30 10 10];
y = [5 5 10 10 5];
figure(4);imshow(bb);title('tasvire khoruji');
hold on
plot(x, y)
plot(x, y, '*')
hold off

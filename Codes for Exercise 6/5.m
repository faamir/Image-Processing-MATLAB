%in barnamei baraye HIT OR MISS ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 1 1 1 1 0 0 0 0 0 0 0 0 0;
       0 0 1 1 1 1 0 0 0 0 0 1 0 0 0;
       0 0 0 0 0 0 0 0 0 0 1 1 1 0 0;
       0 0 0 0 0 0 0 0 0 1 1 1 1 1 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 1 1 1 0; 
       0 0 0 0 0 0 0 0 0 0 0 1 1 1 0;
       0 0 0 1 1 1 0 0 0 0 0 1 1 1 0;
       0 0 0 1 1 1 0 0 0 0 0 1 1 1 0; 
       0 0 0 1 1 1 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
[m n]=size(Img);
%shekle morede josteju
B=[ 1 1 1;1 1 1;1 1 1];
%B=[ 1 1 1 1;1 1 1 1];
[md nd]=size(B);
WB=zeros(md+2,nd+2);
for i=2:md+1
    for j=2:nd+1
        WB(i,j)=B(i-1,j-1);
    end
end

x=0;y=0;
AD = imerode(Img,B);
cm=bitcmp(Img,1);
EE=imerode(cm,WB);
imshow(EE);
Img_out=AD+EE;
for i=2:m-1
    for j=2:n-1
        if([Img_out(i-1,j-1) Img_out(i-1,j) Img_out(i-1,j+1);
                Img_out(i,j-1) Img_out(i,j) Img_out(i,j+1);
                Img_out(i+1,j-1) Img_out(i+1,j) Img_out(i+1,j+1)]==[0 0 0;0 1 0;0 0 0])
                x=i;y=j;
        end
    end
end
for i=1:m
    for j=1:n
        if(i==x && j==y)
            Img_out(i,j)=1;
        else
            Img_out(i,j)=0;
        end
    end
end
subplot(1,3,1)
imshow(Img);
title('tasvire vorudi')
subplot(1,3,2)
imshow(WB);
title('shekle morede nazar baraye yaftan')
subplot(1,3,3)
imshow(Img_out);
title('tasvire khoruji mahale shekl ba Hit or Miss');
%in barnamei baraye COLOR SLICING ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 

clc;
Img_in=imread('2.tif');                            
R=Img_in(:,:,1);
G=Img_in(:,:,2);
B=Img_in(:,:,3);

figure(1);
subplot(1,2,1);
imshow(Img_in);
title('tasvire vorudi');                                 

[x y]=size(R);                                        
O1=zeros(x,y,'uint8');
O2=zeros(x,y,'uint8');                              
O3=zeros(x,y,'uint8');

for i=1:x
    for j=1:y
        T=Img_in(i,j);
        if (T<=160)&&(T>=140)                        
            O2(i,j)=T;          
        else                                             
            O2(i,j)=0;
        end;
    end;
end;
Img_out(:,:,1)=O2;
Img_out(:,:,2)=0;
Img_out(:,:,3)=0;
 
subplot(1,2,2);
imshow(Img_out);
title('tasvire khoruji color slicing');                         

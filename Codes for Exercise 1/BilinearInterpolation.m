%in barnamei baraye DARUNYABI image be raveshe Bilinear(Interpolation)
%ast.BARAYE EJRAYE BARNAME HAME BARNAME
%RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C) VA DAR Command Window MATLAB PASTE KONID VA
%BARAYE MEGHDAR ZOOM IMAGE YEK ADADE VARED NAMAEID.
clc;
clear all;
close all;
INPUT_Img=imread('circles.png');      
 
[row col d] = size(INPUT_Img);  
ZOOM_FAC=input('Enter zoom factor :');                %factore zoom
nr=ZOOM_FAC*row;
nc=ZOOM_FAC*col;
 
for i=1:nr
    
    x=i/ZOOM_FAC;
    
    x1=floor(x);
    x2=ceil(x);
    if x1==0
        x1=1;
    end
    Xd=rem(x,1);
    for j=1:nc
        
        y=j/ZOOM_FAC;
        
        y1=floor(y);
        y2=ceil(y);
        if y1==0
            y1=1;
        end
        Yd=rem(y,1);
        %moadelaat e bilinear 
        C1=INPUT_Img(x1,y1,:);
        C2=INPUT_Img(x1,y2,:);
        C3=INPUT_Img(x2,y1,:);
        C4=INPUT_Img(x2,y2,:);
        
        L1=C3*Yd+C1*(1-Yd);
        L2=C4*Yd+C2*(1-Yd);
        
        ZOOM_Img(i,j,:)=L1*Xd+L2*(1-Xd);
    end
end
%namayeshe image
imshow(ZOOM_Img);

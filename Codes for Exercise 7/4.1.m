%in barnamei baraye OTSU Method BINARY ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img=imread('4.tif');
figure(1);imshow(Img),title('tasvire vorudi')
figure(2);imhist(Img);title('histogram tasvire vorudi');
mx=max(max(Img));
mn=min(min(Img));
ss=double(mn:mx);
Imgsize=size(Img);
msz=Imgsize(1)*Imgsize(2);

for k=1:length(ss)
    dd=ss(1,k);    
    fo=0;
    ba=0;  
    fod=0;
    bod=0;
    for i=1:Imgsize(1)
        for j=1:Imgsize(2)
            T=Img(i,j);
            if(T>=dd)                
                fo=fo+1;
                fod=fod+double(T);
            else                
                ba=ba+1;
                bod=bod+double(T);
            end
        end
    end
    ho=fo/msz;
    hd=ba/msz;
    jo=fod/fo;
    jd=bod/ba;
    ss(2,k)=ho*hd*(jo-jd)*(jo-jd);
end

om=max(ss(2,:));
ind=find(ss(2,:)>=om);
ss=uint8(ss(1,ind));
cs=1;
for i=1:Imgsize(1)
    for j=1:Imgsize(2)
    if (Img(i,j) < ss)
       Img(i,j)=0;
    else
        ww(1,cs)=Img(i,j);
        cs=cs+1;
    end
    end
end
cs=cs-1;
figure(4),imshow(Img),title('tasvire khoruji binary Otsu Method ');



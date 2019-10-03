%in barnamei baraye HOUGH TRANSFORM(CIRCLE) ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc
clear all;
close all;
I=imread('coins.png');
%I=imread('2.png');
stpr=1;
stpa=5;
%entekhab renje shoae dayere ha baraye tashkhis
rara=[10 100];
rmin=min(rara);
rmax=max(rara);
stpa=stpa*pi/180;
[x,y,l]=size(I);
bb=edge(I);
[M,N]=find(bb);
cnt=size(M);
racnt=ceil((rmax-rmin)/stpr);
ancnt=ceil(2*pi/stpa);
hsp=zeros(x,y,racnt);

for i=1:cnt
    for r=1:racnt
        for k=1:ancnt
            a=round(M(i)-(rmin+(r-1)*stpr)*cos(k*stpa));
            b=round(N(i)-(rmin+(r-1)*stpr)*sin(k*stpa));
            if(a>0 & a<=x & b>0 & b<=y)
                hsp(a,b,r)=hsp(a,b,r)+1;
            end
        end
    end
end

trsh = 0.7;
cntm=max(max(max(hsp)));
ind=find(hsp>=cntm*trsh);
ll=size(ind);
hcirc=zeros(x,y);
sh = size(hsp);
for i=1:cnt
    for k=1:ll
        [a,b,r]=ind2sub(sh,ind(k));
        nerkh=((M(i)-a)^2+(N(i)-b)^2)/(rmin+(r-1)*stpr)^2;
        if(nerkh<1.1)
            hcirc(M(i),N(i))=1;
        end
    end
end

figure,imshow(I);title('tasvire vorudi');
figure,imshow(hcirc);title('tasvire khoruji Hough Transform Circle');


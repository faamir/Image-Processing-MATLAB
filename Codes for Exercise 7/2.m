%in barnamei baraye HOUGH TRANSFORM(LINE) ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
%I=imread('cameraman.tif');
I=imread('2.png');
[x,y]=size(I);
Edg=edge(I);
%entekhab daraje khat
daraje=0;
%tul=10;
tul=100;
teta=1;
ro=1;
teta=teta*pi/180;
ru=max(daraje*pi/180);
rl=min(daraje*pi/180);
rr=ru-rl;
rom=(sqrt(x^2+y^2));
nr=ceil(2*rom/ro);
tv=[rl:teta:ru];
nt=length(tv);
romat=zeros(nr,nt);
hl=zeros(x,y);
[M,N]=find(Edg);
cnt=length(M);
rov=zeros(cnt,nt);
for i=1:cnt
    m=M(i);
    n=N(i);
    for k=1:nt
        Rh=(m*cos(tv(k)))+(n*sin(tv(k)));
        Rh_ind = round((Rh+rom)/ro);
        romat(Rh_ind,k)=romat(Rh_ind,k)+1;
        rov(Rh_ind,k)=Rh;
    end
end

ind=find(romat>tul);
for k=1:length(ind)
    [rhth,teth]=ind2sub(size(romat),ind(k));
    theta=tv(teth);
    Rh=rov(rhth,teth);
    for i=1:cnt
        x=M(i);
        y=N(i);
        nerkh=(x*cos(theta)+y*sin(theta))/Rh;
        if (nerkh>1-10^-3 & nerkh<1+10^-3)
            hl(x,y)=1;
        end
    end
end

figure;imshow(I);title('tasvire vorudi');
figure;imshow(hl);title('tasvire khouji Hough Transform');
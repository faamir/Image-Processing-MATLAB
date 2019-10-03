%in barnamei baraye REGION GROWING ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
Img = im2double(imread('7.tif'));
figure;imshow(Img);title('tasvire vorudi');
%seed point
m=50; n=50;
TR=0.1;

if (exist('reg_maxfas','var')==0)
    reg_maxfas=0.2;
end
if (exist('n','var')==0)
    figure, imshow(Img,[]);
    [n,m]=getpts;
    n=round(n(1));
    m=round(m(1));
end

O = zeros(size(Img)); 
Imgsizes = size(Img); 
mm = Img(m,n); 
rs = 1;
nf = 10000; np=0;
nl = zeros(nf,3); 
pd=0;
%hamsaye 4taei
hamsaye=[-1 0; 1 0; 0 -1;0 1];

while(pd<reg_maxfas&&rs<numel(Img))
    for j=1:4,
        xx = m +hamsaye(j,1); yy = n +hamsaye(j,2);
        da=(xx>=1)&&(yy>=1)&&(xx<=Imgsizes(1))&&(yy<=Imgsizes(2));
        if(da&&(O(xx,yy)==0)) 
                np = np+1;
                nl(np,:) = [xx yy Img(xx,yy)]; O(xx,yy)=1;
        end
    end
    if(np+10>nf), nf=nf+10000; nl((np+1):nf,:)=0; end
    fas = abs(nl(1:np,3)-mm);
    [pd, ind] = min(fas);
    O(m,n)=2; rs=rs+1;
    mm= (mm*rs + nl(ind,3))/(rs+1);
    m = nl(ind,1); n = nl(ind,2);
    nl(ind,:)=nl(np,:); np=np-1;
end
O=O>1;

figure, imshow(Img+O);title('tasvire khoruji Region Growing');



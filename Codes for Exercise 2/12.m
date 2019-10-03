%in barnamei baraye LAPLACIAN az tasvir va namayeshe joziate tasvir ast.BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
clc;
clear all;
clear all;
IMG_IN=imread('12.tif');
[m n]=size(IMG_IN);
IMG_IN=im2double(IMG_IN);
FL=[-1 -1 -1;-1 8 -1; -1 -1 -1];
%FL=[1 1 1;1 -8 1; 1 1 1];
%FL=[0 1 0;1 -4 1; 0 1 0];
%FL=[0 -1 0;-1 4 -1; 0 -1 0];

result=IMG_IN;
for i=2:m-1
    for j=2:n-1
        Jam=0;
        x=0;
        y=1;
        
        for k=i-1:i+1
            x=x+1;
            y=1;
            for l=j-1:j+1
                Jam = Jam+IMG_IN(k,l)*FL(x,y);               
                y=y+1;
            end
        end
      result(i,j)=Jam;      
    end
end
result;
vv=IMG_IN+result;

subplot(2,2,1);
imshow(IMG_IN);title('tasvire vorudi');
subplot(2,2,2);
imshow(result);title('Laplacian e tasvire vorudi');
subplot(2,2,3);
imshow(vv);title('jame tasvire vorudi va Laplaciane tasvir');


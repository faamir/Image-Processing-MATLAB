%%in barnamei baraye tolide MOTION BLUR(spatial) ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
Img_in=imread('cameraman.tif');
L=50;
T=-30;
N='salt & pepper';
M='gaussian';
VAR=0.01;
if size(Img_in, 3) == 3,
    Img_in = rgb2gray(Img_in);
end
ID = im2double(Img_in);
IF = fft2(ID);
De = fspecial('motion',L,T);
T1 = psf2otf(De,size(Img_in));
BB = T1.*IF;
iBB = abs(ifft2(BB));
for i = 1:size(iBB, 1)
    for j = 1:size(iBB, 2)
        if iBB(i, j) >= 1
            iBB(i, j) = 0.999999;
        end
        if iBB(i, j) <= 0
            iBB(i, j) = 0.000001;
        end
    end
end        
if nargin>3
    if nargin==4      
        iBB = imnoise(iBB, N);
    elseif nargin==5  
        iBB = imnoise(iBB, N, M);
    elseif nargin==6  
        iBB = imnoise(iBB, N, M, VAR);
    end
end

imshow(iBB);title('tasvire khoruji motion blur spatial');
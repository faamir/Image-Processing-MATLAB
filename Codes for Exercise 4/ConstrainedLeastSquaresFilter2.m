%%in barnamei baraye Constrained Least Squares FILTER ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID.
clear all; clc;
load mydata.mat
D=cat(3,a,b); D=cat(3,D,c);
[M N]=size(D(:,:,1));
NN=[0.001 0.01 2];
k=900; II=15; R0=5; R1=10;
h(1:II,1:II)=II^(-2);
% Wiener Filter
H1=fft2(h,M,N);
p=[0 0 0;
0 -1 0
-1 4 -1
0 -1 0];
FFT=fft2(p,M,N);
%parametr ha
GAMA=[0.5 0.7 2];
DGAMA=[10^-6 10^-6 10^-6];
Iter=5000;
G=zeros(3,Iter);
for i=1:3 %ghodrate noise
    S=NN(i)^2/3;
    a=20/100*S;
    nois=M*N*S;
    C=0;
    while (1)
        %filter
        H1r=conj(H1)./((H1.*conj(H1))+GAMA(i)*(FFT.*conj(FFT)));
        FF=H1r.*fft2(D(:,:,i));
        Fh=real(ifft2(FF));

        Eval=D(:,:,i)-Fh;
        Norm=Eval(:).*Eval(:);

        if ( abs(Norm-nois)<=a | C>Iter )
            C;
        break
        end
            if (Norm>nois)
                GAMA(i)=GAMA(i)-DGAMA(i);
            end
                if (Norm<nois)
                    GAMA(i)=GAMA(i)+DGAMA(i);
                end
                    C=C+1;
                    G(i,C)=GAMA(i);
    end
end
figure;imshow(Fh,[]);title('tasvire khoruji Constrained Least Squares filter');

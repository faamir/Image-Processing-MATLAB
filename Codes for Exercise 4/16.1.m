%%in barnamei baraye INVERSE FILTERING va WIENER FILTER ast,BARAYE
%EJRAYE BARNAME HAME BARNAME RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command
%Window MATLAB PASTE KONID. 
clc;
clear all;
close all;
load mydata.mat
TYPE=2; % ba entekhab TYPE=1 inverse filtering ,ba entekhab TYPE=2 wiener filter
Q=2; %1:teorical,2:expermental,3:SNR
%tasvir vorudi
D=cat(3,a,b); D=cat(3,D,c);
[M N]=size(D(:,:,1));
NN=[0.001 0.01 2];
k=900; II=15; R0=5; R1=10;
h(1:II,1:II)=II^(-2);
%wiener filter
H1=fft2(h,M,N);
for i=1:3
    switch TYPE
        case 1 % Inverse Filtering
            TT=0.05; 
            ID=abs(H1)<=TT;
            H1(ID)=TT;
            %FFT
            G=fft2(D(:,:,i),M,N);
            FF=G./H1;
            Fh=ifft2(FF);
        case 2 % Wiener Filter
        switch Q
        case 0 %  theoretical 
            RR=R0^2*(1-k/(M*N-1))*(1-k/(M*N))+2*R0*R1*(k/(M*N-1))*(1-k/(M*N))+...
            R1^2*k*(k-1)/(M*N*(M*N-1));
            MU_2=R0^2*(1-k/(M*N))+R1^2*k/(M*N);
            RF(1:M,1:N)=RR;
            RF(1,1)=MU_2;
            SF=fft2(RF);
            RN=zeros(M,N);
            RN(1,1)=NN(i)^2/3;
            SN=fft2(RN);
            Hr=conj(H1).*SF./((H1.*conj(H1)).*SF+SN);
        case 1 % experimental
            PP=k/(M*N);
            SML=rand(M,N);
            SML=double(R0*(SML>PP))+double(R1*(SML<=PP));
            RF=xcorr2(SML)/(M*N);
            RF=RF(M:(2*M-1),N:(2*N-1));
            SF=fft2(RF);
            E=2*NN(i)*(rand(M,N)-0.5);
            RN=xcorr2(E)/(M*N);
            RN=RN(M:(2*M-1),N:(2*N-1));
            SN=fft2(RN);
            H1r=conj(H1).*SF./((H1.*conj(H1)).*SF+SN);
        case 2 %SNR
            SNR=10^(12/10); 
            H1r=conj(H1)./((H1.*conj(H1))+1./SNR);
        end
            FF=H1r.*fft2(D(:,:,i));
            Fh=real(ifft2(FF));
        end
            figure(i);
            imshow(D(:,:,i),[]);
            figure(3+i);
            imshow(Fh,[]);
        if TYPE==1
        else
        end
end
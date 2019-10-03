%in barnamei baraye tashkhise ajzaye motasel dar tasvir(connected
%component)be raveshe hamjavari 4taei ast.BARAYE EJRAYE BARNAME HAME BARNAME
%RA ENTEKHAB KARDE(Ctrl+A & Ctrl+C)VA DAR Command Window MATLAB PASTE KONID.BARAYE
%MESAL HAYE BISHTAR COMMENT E JELOYE INPUT_Img RA BARDARID VA MATRIX YA
%TASVIRE DELKHAH RA JAYGOZIN KONID.
clc;
clear all;
close all;
%INPUT_Img=imread('circles.png')
INPUT_Img=[  1     1     0     5     5     5     0     6;
        0     1     0     5     0     5     0     6;
        0     1     1     1     0     0     0     6;
        0     0     4     0     0     0     6     6;
        4     4     4     3     0     5     0     6;
        0     0     0     3     0     5     0     6;
        2     2     0     3     3     0     0     7;
        2     2     0     3     0     7     7     7 ];
 %ijade matris  
 [r,c] = size(INPUT_Img);   

 %kadri az 0
 OUTPUT = [zeros(1,c+2);[zeros(r,1) INPUT_Img zeros(r,1)];zeros(1,c+2)];

 %tekrar dar hame eleman ha
 FLAG=0;%flag
 LP=1;  %loop
 while not(FLAG) && LP<r*c
     FLAG=1;LP=LP+1;
     for i=2:r+1
         for j=2:c+1
            n = OUTPUT(i,j);
            if n >= 1
                %entekhab eleman ha az eleman haye fa'al
                if OUTPUT(i-1,j)==0;Uu=inf;else Uu = OUTPUT(i-1,j); end;%eleman bala
                if OUTPUT(i+1,j)==0;Dd=inf;else Dd = OUTPUT(i+1,j); end;%eleman paein
                if OUTPUT(i,j-1)==0;Ll=inf;else Ll = OUTPUT(i,j-1); end;%eleman chap
                if OUTPUT(i,j+1)==0;Rr=inf;else Rr = OUTPUT(i,j+1); end;%eleman rast

                OUTPUT(i,j) = min([Uu Dd Ll Rr]);
                %ba taghiir flag set mishavad
               if OUTPUT(i,j) ~= n
                    FLAG = 0;
               end
            end
         end
     end
 end

 %hazf laye 0
 INPUT_Img = OUTPUT(2:end-1,2:end-1)

function v = spte(B, mindim, fun) 
k=size(B,3);
v(1:k)=false; 
for I=1:k 
quadregion=B(:,:,I);
    if size(quadregion,1) <= mindim
v(I)=false;
    continue 
    end
flag=feval(fun, quadregion);
    if flag
v(I)=true;
    end
end

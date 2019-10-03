function flag = pish(region)
 
sd=std2(region);
 
m=mean2(region);
 
flag=(sd > 1) & ((m>0) & (m < 205));
 
end
 
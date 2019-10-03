function g = spme(f, mindim, fun) 
Q=2^nextpow2(max(size(f)));
[M N]=size(f); 
f=padarray(f,[Q - M, Q - N],'post');
S=qtdecomp(f, @spte, mindim, fun);
Lmax = full(max(S(:)));
g=zeros(size(f));
MARKER = zeros(size(f));

for K = 1:Lmax
[vals, r, c]=qtgetblk(f,S,K); 
    if ~isempty(vals)
        for I = 1:length(r)
            xlow=r(I);ylow=c(I); 
            xhigh=xlow+K-1;yhigh=ylow+K-1; 
            region=f(xlow:xhigh,ylow:yhigh);
            flag=feval(fun,region);
            if flag
                g(xlow:xhigh,ylow:yhigh)=1;
                MARKER(xlow,ylow)=1;
            end
        end
    end
end

g=bwlabel(imreconstruct(MARKER,g));
g=g(1:M,1:N);
imshow(g)
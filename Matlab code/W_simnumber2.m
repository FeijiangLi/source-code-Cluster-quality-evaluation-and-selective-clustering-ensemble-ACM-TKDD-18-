function [sim] = W_simnumber2(cls,w)
[n,~]=size(cls);
clbs = clstoclbs(cls')';
w=repmat(w,n,1);
clbs=w.*clbs;
sim=sqrt(clbs)*sqrt(clbs)';
sim=sim./(max(max(sim)));
for i=1:n
    sim(i,i)=1;
end
end


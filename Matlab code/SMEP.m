function [sim] = SMEP(c1,c2)
k=length(unique(c1));
s=zeros(1,k);
for i=1:k
    c=double(c1==i);
    s(i)=SME(c,c2);
end
s1=sum(s)/k;


k=length(unique(c2));
s=zeros(1,k);
for i=1:k
    c=double(c2==i);
    s(i)=SME(c,c1);
end
s2=sum(s)/k;

sim=(s1+s2)/2;
end


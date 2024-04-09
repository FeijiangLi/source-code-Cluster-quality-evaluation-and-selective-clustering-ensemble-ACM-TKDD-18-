function clb = BI_clusters(cl)
[n,m]=size(cl);
[newE, no_allcl] = relabelCl(cl);
clb=zeros(n,no_allcl);
for i=1:m
    now_cl=newE(:,i);
    for j=min(now_cl):max(now_cl)
        clb(:,j)=now_cl==j;
    end
end
end
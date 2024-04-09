function [weight] = weighted_B_cluster(clusterings)

clb = BI_clusters(clusterings);
[~,m]=size(clb);
[~,m1]=size(clusterings);
weight=zeros(1,m);
for i=1:m
 
    B_cl=clb(:,i);
    ind=zeros(1,m1);
    for j=1:m1
        ind(j)=SME(B_cl,clusterings(:,j));
    end
    weight(i)=sum(ind)/m1;
end
 weight=weight./(sum(weight));
 weight=weight.*m;
end


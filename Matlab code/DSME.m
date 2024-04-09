function [clustering] = DSME( clustering_set,k,select_number)
[~,m]=size(clustering_set);
clustering=EAC_sl(clustering_set,k);

sme_value=zeros(1,m);
for i=1:m
    now_cl=clustering_set(:,i);
    k_i=length(unique(now_cl));
    local_weight=zeros(1,k_i);
    for j=1:k_i
        now_cluster=double(now_cl==j);
        local_weight(j)=SME(now_cluster,clustering);
    end
    sme_value(i)=sum(local_weight)/k_i;
end

[~,sle_locat]=sort(sme_value);
sel=clustering_set(:,sle_locat(1:select_number));

[w] = weighted_B_cluster(sel);

[clustering] =W_EAC_sl(sel,w,k);

end


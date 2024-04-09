function [ind] =SME(cluster,clustering)

locat= cluster==1;
n=sum(cluster);
clustering_locat=clustering(locat);
k=unique(clustering_locat);
co_k=length(k);
co_m=zeros(1,co_k);
for i=1:co_k
    co_m(i)=sum(clustering_locat==k(i));
end
ac_cluster=max(co_m)/n;
m=zeros(1,co_k);
for i=1:co_k
    now_k=k(i);
    ni=sum(clustering_locat==now_k);
    mi=sum(clustering==now_k);
    m(i)=ni^2/(n*mi);
end
ind=ac_cluster*sum(m);
end


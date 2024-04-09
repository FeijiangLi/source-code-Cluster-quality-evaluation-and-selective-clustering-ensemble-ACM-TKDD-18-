function [result] =W_EAC_sl(clusters,w,k)
[sim] = W_simnumber2(clusters,w);
%dis=pdist(sim);
dis=1-sim;
for i=1:size(sim)
    dis(i,i)=0;
end
newsim_dist = squareform(dis);
Z=linkage(newsim_dist,'average');
result=cluster(Z,k);
end
function [result] = EAC_sl(clusters,k)
[sim] = simnumber(clusters);
dis=1-sim;
newsim_dist = squareform(dis);
Z=linkage(newsim_dist,'average');
result=cluster(Z,k);
end
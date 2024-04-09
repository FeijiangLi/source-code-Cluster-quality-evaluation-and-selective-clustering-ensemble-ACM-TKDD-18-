load wine.mat
gt=data(:,end);
H=50;
select_number=25;
k=length(unique(gt));
data_feature=data(:,1:end-1);
data_feature=predata(data_feature);
[clustering_set] =creat_clusters_randomk_kmeans(data_feature,H);
[cl] = DSME( clustering_set,k,select_number);
[ac,ARI,NMI] = evaluate2(cl,gt,k)
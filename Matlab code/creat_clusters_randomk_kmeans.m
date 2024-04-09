function [clusters] =creat_clusters_randomk_kmeans(data,H)
[n,~]=size(data);
clusters=zeros(n,H);
maxk=floor(sqrt(n));
% maxk=min(maxk,50);
allk=round(rand(1,H)*(maxk-2))+2;
for i=1:H
    k=allk(i);
    clusters(:,i)=kmeans(data,k,'emptyaction','singleton');
end

end
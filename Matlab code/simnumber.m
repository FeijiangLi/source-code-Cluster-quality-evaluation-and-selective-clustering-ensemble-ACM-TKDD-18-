function [sim] = simnumber(clusters) 
[N,M] = size(clusters); % no. of clustering
newE = zeros(N,M);
ucl = unique(clusters(:,1)); % all clusters in i-th clustering
if (max(clusters(:,1) ~= length(ucl)))
    for j = 1:length(ucl)
        newE(clusters(:,1) == ucl(j),1) = j; % re-labelling
    end
end

for i = 2:M
    ucl = unique(clusters(:,i)); % all clusters in i-th clustering
    prevCl = length(unique(newE(:,[1:i-1])));
    for j = 1:length(ucl)
        newE(clusters(:,i) == ucl(j),i) = prevCl + j; % re-labelling
    end
end
no_allcl = max(max(newE));

[n,m]=size(newE);
max_E=max(newE);
min_E=min(newE);
relabel=zeros(n,no_allcl);
for i=1:m
    cl=newE(:,i);
    for j=min_E(i):max_E(i)
        relocat=cl==j;
        relabel(relocat,j)=1;
    end
end


sim=relabel*relabel'./M;

end
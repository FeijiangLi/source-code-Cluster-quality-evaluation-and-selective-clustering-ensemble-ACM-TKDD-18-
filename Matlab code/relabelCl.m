function [newE, no_allcl] = relabelCl(E) 

[N,M] = size(E); 
newE = zeros(N,M);

ucl = unique(E(:,1)); 
if (max(E(:,1) ~= length(ucl)))
    for j = 1:length(ucl)
        newE(E(:,1) == ucl(j),1) = j; 
    end
end


for i = 2:M
    ucl = unique(E(:,i)); 
    prevCl = length(unique(newE(:,[1:i-1])));
    for j = 1:length(ucl)
        newE(E(:,i) == ucl(j),i) = prevCl + j; 
    end
end

no_allcl = max(max(newE));
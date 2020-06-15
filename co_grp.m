function [ J ] = co_grp(L,Gen_serial)
 [r c]=size(L);
 K=zeros(r,c); J=K;
for i=1:r
    for j=1:c
        K(i,j)=abs(1-L(i,j));
    end
end
for i=1:r
    [a b]=min(K(i,:));
    J(i,b)=Gen_serial(i);
        
end

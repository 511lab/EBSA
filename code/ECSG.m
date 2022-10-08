function [ idx_T,Y]=ECSG(nlable,Y_LU,X,idx_LU,Y)
    C=[];
    c=length(nlable);
    for i = nlable'
        idx_UL=idx_LU(find(Y_LU==i));
        X_i=X(idx_UL,:);
        c_i=mean(X_i,1);
        C=[C;c_i];
    end
    
    rci_i=pdist2(C,C,'Euclidean');
    for j=1:c
        idxLU=idx_LU(find(Y_LU==j));
        X_j=X(idxLU,:);
        Y_j=Y_LU(idxLU,:);
        c_j=mean(X_j,1);
        l_j=pdist2( X_j,c_j,'Euclidean');
        
        rij = rci_i(j,:);
        r_ij=min(rij(rij~=0));
        h_ij=0.5*r_ij;
        idx_t=idxLU(find(l_j<=h_ij));
        for m=1:length(idx_t)
            Y(idx_LU(idx_t(m)))=Y_LU(idx_LU(idx_t(m)));
        end
        YT=Y( idx_t,:);
        idx_W=idx_t(find(YT~=j));
        for l=1:length(idx_W)
            Y(idx_LU(idx_W(l)))=j;
        end
        
        idx_T=[ idx_T; idx_t];
    end
end
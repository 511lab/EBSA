function [Y,mdl] = EBSA(X,Y,idx_Ul)
[n,~]=size(X);
idx_L=idx_Ul';
idx_X1=[1:n];
idx_X=idx_X1';
idx_t=[];
T=[];
idx_T=[];
 count=1;
  r=1;
while true
    
    X_L=X(idx_L,:);
    Y_L=Y(idx_L,:);
    idx_U=setdiff(idx_X,idx_L);
    XU=X(idx_U,:);
    Y_U=Y(idx_U,:);
    mdl= fitctree(X_L,Y_L);
    pred_lbl = predict(mdl,XU);
    idxLU=[idx_L;idx_U];
    idx_LU=sort( idxLU);
    Y_LU=Y( idx_LU,:);
    nlable = unique(Y_L);
    for l=1:length(idx_U)
        Y_LU(idx_U(l))=pred_lbl(l);
    end
    C=[];
    c=length(nlable);
    for i = nlable'
        idx_UL=idx_LU(find(Y_LU==i));
        X_i=X(idx_UL,:);
        c_i=mean(X_i,1);
        C=[C;c_i];
    end

    rci_i=pdist2(C,C,'Euclidean');
   
    for j = nlable'
        idxLU=idx_LU(find(Y_LU==j));
        X_j=X(idxLU,:);
        Y_j=Y_LU(idxLU,:);
        c_j=mean(X_j,1);
        l_j=pdist2(X_j,c_j,'Euclidean');
        if r>c
            break;
        end
        rij = rci_i(r,:);
        r_ij=min(rij(rij~=0));
        h_ij=0.5*r_ij;
        idx_t=idxLU(find(l_j<=h_ij));
        for m=1:length(idx_t)
            Y(idx_LU(idx_t(m)))=Y_LU(idx_LU(idx_t(m)));
        end
        YT=Y_LU(idx_t,:);
        idx_W=idx_t(find(YT~=j));
        
        for l=1:length(idx_W)
            Y(idx_LU(idx_W(l)))=j;
        end
        
        idx_T=[ idx_T; idx_t];
        r=r+1;
        
    end
    idx_LUL=setdiff(idx_T,idx_L);
    if isempty(idx_LUL)
        break;
    end
    
    idx_L=[idx_L;idx_LUL];
    
    count=count+1;
    nl=length(idx_L)；
end
   nc=count
   mdl= fitctree(X,Y);

end

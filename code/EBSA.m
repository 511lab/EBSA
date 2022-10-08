function [Y,mdl] = EBSA(X,Y,idx_Ul)
[n,~]=size(X);
idx_L=idx_Ul';
idx_X1=[1:n];
idx_X=idx_X1';
idx_t=[];
T=[];
idx_T=[];
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
    [ idx_T,Y]=ECSG(nlable,Y_LU,X,idx_LU,Y);
    
    idx_LUL=setdiff(idx_T,idx_L);
    if isempty(idx_LUL)
        break;
    end
    
    idx_L=[idx_L;idx_LUL];
end
mdl= fitctree(X_L,Y_L);

end

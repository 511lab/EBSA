function [full_label,sample_lbl,sample_lbl_index]=noise_samples(label,percent,method)
    [n,m]=size(label);
    sample_lbl=[];
    full_label=zeros(n,m)-1;
    switch method
        case 'class'
            [sorted_label,idx_label]=sort(label);
            c=unique(sorted_label)';
            count=0;
            index=[];
            for i=c
                lbl=sorted_label(sorted_label(:,1)==i);
                len=length(lbl);
                num=min(ceil(len*percent/100),len);
                idx=randperm(len,num);
                idx=sort(idx)+count;
                index=[index;idx'];
                count=count+len;
            end
            sample_lbl_index=idx_label(index);
        case 'all'
            num=min(ceil(n*percent/100),n);
            sample_lbl_index=sort(randperm(n,num));
    end   
    for i=sample_lbl_index'
        sample_lbl=[sample_lbl;label(i,:)];
        full_label(i,:)=label(i,:);
    end
    [~,noise_lbl,noise_index]=Random_sampling(sample_lbl,80,"all");
    h=unique(sample_lbl);
    noiselbl=[];
    for g=1:length(noise_index)
        for j=h'
            l=setdiff(h,j);  
            if noise_lbl(g)==j
                noiselbl(g)=l(randperm(numel(l),1));
            end
        end
    end
    for u=1:length(noise_index)
        full_label(sample_lbl_index(noise_index(u)))=noiselbl(u);
    end
    
end
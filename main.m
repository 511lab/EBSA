%% loading data
load('data.mat') 
for rslpct=10:10:10%Initial labeled sample proportion
    measure=[];
    for count = 1:50 %Find the average of 50 times as the experimental result
        [yt,~,idx_Ul]=Random_sampling(Y,rslpct,'all');%stratified sampling
        t0=cputime;
        %train
        [lbl, mdl] = EBSA(X,yt,idx_Ul);
        %test
        pred_lbl=predict(mdl,X);
        timep=cputime-t0;%program running time
        [out] = classification_evaluation(Y',pred_lbl');
        measure=[measure;out.avgAccuracy,out.fscoreMicro,timep];
    end
    mean_measure=mean(measure,1);
    var_measure=var(measure,1);
    sqrt_measure=sqrt(var_measure);
    result=[result;mean_measure,sqrt_measure,rslpct];  
    if exist(filename,'file')
        delete(filename)
    end
    xlswrite(filename,result)
end
disp("Parameters are saved£¡")
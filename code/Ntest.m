clear;
clc;
dataset_name={'UPS'};
ssc_name={'EBSA'};
for ds=1:length(dataset_name)%dataset_name
    dataset=dataset_name{ds};
    file=strcat('datasets\',dataset,'.mat');
    load(file);
    for cf=1:length(ssc_name)
        sscf=ssc_name{cf};
        result=[];
        filename=strcat('result_meanvar\',dataset,"_",sscf,"_r10(80%).xlsx");
        class=length(unique(Y)); 
        %Initial labeled sample scale
        for rslpct=10:10:10
            measure=[];
            %Take the average of 50 times as the experimental result
            for count = 1:50 
                [yt,~,idx_Ul]=noise_samples(Y,rslpct,'all');
                t0=cputime;
                if strcmp(sscf,"EBSA")
                    
                    %train
                    [lbl, mdl] = EBSA(X,yt,idx_Ul);
                    %test
                    pred_lbl=predict(mdl,X);
                    % pred_lbl=svmpredict(Y,X,mdl,'-b 1');
                    
                end
                timep=cputime-t0;%runtime
                [out] = classification_evaluation(Y',pred_lbl');
                measure=[measure;out.avgAccuracy,out.fscoreMicro,timep];%out.fscoreMacro,out.fscoreMicro
            end
            mean_measure=mean(measure,1);
%             var_measure=var(measure,1);
%             result=[result;mean_measure,var_measure,rslpct];
            var_measure=var(measure(:,1:2),1);
            sqrt_measure=sqrt(var_measure);
            result=[result;mean_measure,sqrt_measure,rslpct];
            %             result=[result;mean_measure,rslpct];
        end
        if exist(filename,'file')
            delete(filename)
        end
        xlswrite(filename,result)
    end
end
disp("The parameter is saved！")
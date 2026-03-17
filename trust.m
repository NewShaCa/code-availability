data = readtable('final_df_clean__1_5_IQR.csv')
glme = fitglme(data,'Money_Transfered ~ 1 + Happy + Fair + previous_trial_Amount_Returned_normalized + group + Fair:Happy + group:Fair + group:Happy + (1+Fair+Happy|Participant_ID)')
glme = fitglme(data,'RT_Investment ~ 1 + Happy + Fair + group + Fair:Happy + group:Fair + group:Happy + (1+Fair+Happy|Participant_ID)')

%%
data=readtable('tmp2.csv');
data_least = data(strcmp(data.mostleast,'least'),:);
data_least_short = data_least(strcmp(data_least.term,'short'),:);
data_least_long = data_least(strcmp(data_least.term,'long'),:);

data_most = data(strcmp(data.mostleast,'most'),:);
data_most_short = data_most(strcmp(data_most.term,'short'),:);
data_most_long = data_most(strcmp(data_most.term,'long'),:);

glme = fitglme(data_least_short,'A_BMI_numeric ~ Autism_diagnosis + BMI + Age + (1|sub_id)')
glme = fitglme(data_least_long,'A_BMI_numeric ~ Autism_diagnosis + BMI + Age + (1|sub_id)')
glme = fitglme(data_most_short,'A_BMI_numeric ~ Autism_diagnosis + BMI + Age + (1|sub_id)')
glme = fitglme(data_most_long,'A_BMI_numeric ~ Autism_diagnosis + BMI + Age + (1|sub_id)')

glme = fitglme(data_least_short,'A_WHR ~ Autism_diagnosis + A_BMI+ BMI + Age + (1|sub_id)')
glme = fitglme(data_least_long,'A_WHR ~ Autism_diagnosis + A_BMI+ BMI + Age + (1|sub_id)')
glme = fitglme(data_most_short,'A_WHR ~ Autism_diagnosis + A_BMI+ BMI + Age + (1|sub_id)')
glme = fitglme(data_most_long,'A_WHR ~ Autism_diagnosis + A_BMI+ BMI + Age + (1|sub_id)')


%%
fitglme(data,'Autism_diagnosis ~ 1 + A_BMI + A_WHR + BMI + Age + term + mostleast:term + (1 + mostleast + term | sub_id)')

%% first
glme = fitglme(data,'A_WHR ~ Autism_diagnosis + term + Age + BMI + A_BMI + mostleast:term + mostleast:Autism_diagnosis + mostleast:Autism_diagnosis:term +  term:Autism_diagnosis + (1+term+mostleast|sub_id)')


data_most_long_autism = data(strcmp(data_most_long.Autism_diagnosis,'yes'),:);

glme = fitglme(data(strcmp(data.mostleast,'least'),:),'A_WHR ~ Autism_diagnosis + term + BMI + A_BMI +  term:Autism_diagnosis + (1+term|sub_id)')
glme = fitglme(data(strcmp(data.mostleast,'most'),:),'A_WHR ~ Autism_diagnosis + term + BMI + A_BMI +  term:Autism_diagnosis + (1+term|sub_id)')

% data_face_2 = data(strcmp(data.face_id,'face_2'),:);
% data_face_2_autism = data(strcmp(data.Autism_diagnosis,'yes'),:);
% data_face_2_healthy = data(strcmp(data.Autism_diagnosis,'no'),:);

glme = fitglme(data,'face_attractive_1f_12m ~ 1 + Autism_diagnosis + Age + BMI')

glme = fitglme(data,'A_WHR_cross_A_BMI ~ 1 + Autism_diagnosis + Age + (1|sub_id)')

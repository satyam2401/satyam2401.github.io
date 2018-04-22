[si, ~, ~] = xlsread('sitting_data.csv');   % For Sitting
[sd, ~, ~] = xlsread('standing_data.csv');   % For Standing
[wk, ~, ~] = xlsread('walking_data.csv');   % For Walking
[ru, ~, ~] = xlsread('running_data.csv');    % For Running
[st, ~, ~] = xlsread('stairs_data.csv');    % For Stairs
[cl, ~, ~] = xlsread('cycling_data.csv');    % For Cycling

si_x = si(:,1); si_y = si(:,2); si_z = si(:,3);
sd_x = sd(:,1); sd_y = sd(:,2); sd_z = sd(:,3);
wk_x = wk(:,1); wk_y = wk(:,2); wk_z = wk(:,3);
ru_x = ru(:,1); ru_y = ru(:,2); ru_z = ru(:,3);
st_x = st(:,1); st_y = st(:,2); st_z = st(:,3);
cl_x = cl(:,1); cl_y = cl(:,2); cl_z = cl(:,3);


feat_1=[];
feat_2=[];
feat_3=[];
feat_4=[];
feat_5=[];
feat_6=[];

for i = 1:159
    w1_x = si_x((i*10-9):(i*10));
    w1_y = si_y((i*10-9):(i*10));
    w1_z = si_z((i*10-9):(i*10));
    [a, b, c, d, e, f, g, h, q, j, k ] = FeatureVec(w1_x, w1_y, w1_z);
    feat_1= [feat_1; [a b c d e f g h q j k]];
    
    w2_x = sd_x((i*10-9):(i*10));
    w2_y = sd_y((i*10-9):(i*10));
    w2_z = sd_z((i*10-9):(i*10));
    [a, b, c, d, e, f, g, h, q, j, k] = FeatureVec(w2_x, w2_y, w2_z);
    feat_2= [feat_2; [a b c d e f g h q j k]];
    
    w3_x = wk_x((i*10-9):(i*10));
    w3_y = wk_y((i*10-9):(i*10)); 
    w3_z = wk_z((i*10-9):(i*10));
    [a, b, c, d, e, f, g, h, q, j, k] = FeatureVec(w3_x, w3_y, w3_z);
    feat_3= [feat_3; [a b c d e f g h q j k]];
     
    w4_x = ru_x((i*10-9):(i*10));
    w4_y = ru_y((i*10-9):(i*10)); 
    w4_z = ru_z((i*10-9):(i*10));
    [a, b, c, d, e, f, g, h, q, j, k] = FeatureVec(w4_x, w4_y, w4_z);
    feat_4= [feat_4; [a b c d e f g h q j k]];
    
    w5_x = st_x((i*10-9):(i*10));
    w5_y = st_y((i*10-9):(i*10)); 
    w5_z = st_z((i*10-9):(i*10));
    [a, b, c, d, e, f, g, h, q, j, k] = FeatureVec(w5_x, w5_y, w5_z);
    feat_5= [feat_5; [a b c d e f g h q j k]];
    
    w6_x = cl_x((i*10-9):(i*10));
    w6_y = cl_y((i*10-9):(i*10)); 
    w6_z = cl_z((i*10-9):(i*10));
    [a, b, c, d, e, f, g, h, q, j, k] = FeatureVec(w6_x, w6_y, w6_z);
    feat_6= [feat_6; [a b c d e f g h q j k]];
   
end

%plot feature scatters
scatter3(feat_1(:,1), feat_1(:,2), feat_1(:,3), 'r');
hold on;
scatter3(feat_2(:,1), feat_2(:,2), feat_2(:,3), 'g');
hold on;
scatter3(feat_3(:,1), feat_3(:,2), feat_3(:,3), 'k');
hold on;
scatter3(feat_4(:,1), feat_4(:,2), feat_4(:,3), 'b');
hold on;
scatter3(feat_5(:,1), feat_5(:,2), feat_5(:,3), 'm');
hold on;
scatter3(feat_6(:,1), feat_6(:,2), feat_6(:,3), 'c');


figure
scatter3(feat_1(:,4), feat_1(:,5), feat_1(:,6), 'r');
hold on;
scatter3(feat_2(:,4), feat_2(:,5), feat_2(:,6), 'g');
hold on;
scatter3(feat_3(:,4), feat_3(:,5), feat_3(:,6), 'k');
hold on;
scatter3(feat_4(:,4), feat_4(:,5), feat_4(:,6), 'b');
hold on;
scatter3(feat_5(:,4), feat_5(:,5), feat_5(:,6), 'm');
hold on;
scatter3(feat_6(:,4), feat_6(:,5), feat_6(:,6), 'c');

figure
scatter3(feat_1(:,7), feat_1(:,8), feat_1(:,9), 'r');
hold on;
scatter3(feat_2(:,7), feat_2(:,8), feat_2(:,9), 'g');
hold on;
scatter3(feat_3(:,7), feat_3(:,8), feat_3(:,9), 'k');
hold on;
scatter3(feat_4(:,7), feat_4(:,8), feat_4(:,9), 'b');
hold on;
scatter3(feat_5(:,7), feat_5(:,8), feat_5(:,9), 'm');
hold on;
scatter3(feat_6(:,7), feat_6(:,8), feat_6(:,9), 'c');

figure
scatter(feat_1(:,10), feat_1(:,11), 'r');
hold on;
scatter(feat_2(:,10), feat_2(:,11), 'g');
hold on;
scatter(feat_3(:,10), feat_3(:,11), 'k');
hold on;
scatter(feat_4(:,10), feat_4(:,11), 'b');
hold on;
scatter(feat_5(:,10), feat_5(:,11), 'm');
hold on;
scatter(feat_6(:,10), feat_6(:,11), 'c');

%write features to csv files
csvwrite('f_si.csv',feat_1);
csvwrite('f_sd.csv',feat_2);
csvwrite('f_wk.csv',feat_3);
csvwrite('f_ru.csv',feat_4);
csvwrite('f_st.csv',feat_5);
csvwrite('f_cl.csv',feat_6);
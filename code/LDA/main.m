% % Two classes
X=[1.04, 1.16, 1.24, 1.34, 1.4, 1.57, 1.35, 1.23, 1.43, 1.46, 1.53, 1.69;
     2.1, 2.4, 3, 2.5, 3.3, 3.1, 1, 1.43, 0.97, 1.4, 1.46, 1.43];
Y=[1,1,1,1,1,1,2,2,2,2,2,2];
color=[1,0,0;1,0,0;1,0,0;1,0,0;1,0,0;1,0,0;0,0,1;0,0,1;0,0,1;0,0,1;0,0,1;0,0,1];
fig=scatter(X(1,:),X(2,:),25,color,'filled');
waitfor(fig)
% xlabel('x');
% ylabel('y');
% w=Two_Class_LDA(X,Y);
% X=w'*X;
% scatter(X,Y,25,color,'filled');
% xlabel("projected data")
% ylabel("class");

% Multi classes
clear;
% address='D:\机器学习\人脸数据集\Yale_face10080\face10080\subject';
% pattern='.bmp';
address='D:\机器学习\人脸数据集\AR_Gray_50by40\AR0'; 
pattern='.tif';
% address='D:\机器学习\人脸数据集\ORL56_46\orl';
% pattern='.bmp';
% address='D:\机器学习\人脸数据集\coil-20-proc\obj';
% pattern='.png';

class_num=10;
each_class_num=10;
train_num=6;
k=4;

% read data
[X_train,X_test,Y_train,Y_test,row,col]=Read_data(address,class_num,each_class_num,train_num,pattern);
W1=Multi_Class_LDA(X_train,Y_train,class_num);
[W2,Mean]=PCA(X_train);

% LDA Recognition
dim_PCA=160;
for i=1:3:43
%     rate1=LDARecognition(W1,X_train,X_test,Y_train,Y_test,k,i);
%     rate2=PCARecogntion(W2,X_train,X_test,Y_train,Y_test,k,i,Mean);
    rate3=PCAwithLDA(W2,class_num,dim_PCA,i,X_train,Y_train,X_test,Y_test,k,Mean);
%     fprintf("    PCA     : 维度为%d时,识别率为%f\n",i,rate1);
%     fprintf("    LDA     : 维度为%d时,识别率为`%f\n",i,rate2);
    fprintf("PCA with LDA: 维度为%d时,识别率为%f\n",i,rate3);
%     fprintf("---------------------------------------\n");
end

% Two and Three dimension visualization
% color=[1,0,0;1,0,0;1,0,0;0,0,1;0,0,1;0,0,1;0,1,0;0,1,0;0,1,0];
% FisherVisualization(X_test,Y_test,W1,color,row,col);
% EigenVisualization(X_test,Y_test,W2,color,row,col,Mean);

% face rebuild
% Rebuild_LDA(W1,X_test,row,col);
% Rebuild_PCA(W2,X_test,row,col,Mean);

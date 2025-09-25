clear;
% load('data1.mat');
% initial data show
% plot_data(X,y);

% hard SVM train
% model=Hard_SVM(X,y);
% visualizeLinearBoundary(X,y,model);

% soft SVM train
% C=SelectNiceC(X,y);
% fprintf("The best C is %f\n",C);
% model=Soft_SVM(X,y,C);
% visualizeLinearBoundary(X,y,model);

% load('data2.mat');
% initial data show
% plot_data(X,y);
% model=Hard_SVM(X,y);
% visualizeLinearBoundary(X,y,model);

% hard kernel SVM train
% sigma=0.03;
% model=Hard_Kernel_SVM(X,y, @(x1, x2)gaussianKernel(x1,x2,sigma));
% visualizeUnlinearBoundary(X,y,model);

% soft kernel SVM train
% C=0.03;
% sigma=0.03;
% model=Soft_Kernel_SVM(X,y,C, @(x1, x2)gaussianKernel(x1,x2,sigma));
% visualizeUnlinearBoundary(X,y,model);

address='D:\机器学习\人脸数据集\Yale_face10080\face10080\subject';
pattern='.bmp';
% address='D:\机器学习\人脸数据集\AR_Gray_50by40\AR0'; 
% pattern='.tif';
% address='D:\机器学习\人脸数据集\ORL56_46\orl';
% pattern='.bmp';
% address='D:\机器学习\人脸数据集\coil-20-proc\obj';
% pattern='.png';

class_num=10;
each_class_num=10;
train_num=7;
k=4;
[X_train,X_test,Label_train,Label_test,row,col]=Read_data(address,class_num,each_class_num,train_num,pattern);

% LDA recognition
% for LDA_components=10:10:160
%    model=LDA(X_train,Label_train,LDA_components);
%    rate=KNN(model,X_train,X_test,Label_train,Label_test,k);
%    fprintf("dimension=%d,LDA recognition rate:%f\n",LDA_components,rate);
% end

% PCA recognition
% for PCA_components=10:10:160
%     model=PCA(X_train,PCA_components);
%     X_train=X_train-model.mean;
%     X_test=X_test-model.mean;
%     rate=KNN(model,X_train,X_test,Label_train,Label_test,k);
%     fprintf("dimension=%d,PCA recognition rate:%f\n",PCA_components,rate);
% end

% SVM recognition with PCA
% rates=[];
% for dimension=10:10:160
%     model=PCA(X_train,dimension);
%     traini=model.W'*(X_train-model.mean);
%     testi=model.W'*(X_test-model.mean);
%     prediction=MultiClassSVM(traini,testi,Label_train);
%     [~,col_test]=size(X_test);
%     correct=0;
%     for i=1:col_test
%         if(Label_test(i)==prediction(i))
%             correct=correct+1;
%         end
%     end
%     rate=correct/col_test;
%     rates=[rates rate];
%     %fprintf("dimension=%d,SVM with PCA recognition rate:%f\n",dimension,rate);
% end

% SVM recognition with LDA
% rates=[];
% for dimension=1:4:41
%     model=LDA(X_train,Label_train,dimension);
%     traini=model.W'*X_train;
%     testi=model.W'*X_test;
%     prediction=MultiClassSVM(traini,testi,Label_train);
%     [~,col_test]=size(X_test);
%     correct=0;
%     for i=1:col_test
%         if(Label_test(i)==prediction(i))
%             correct=correct+1;
%         end
%     end
%     rate=correct/col_test;
%     rates=[rates rate];
%     %fprintf("dimension=%d,SVM with LDA recognition rate:%f\n",dimension,rate);
% end

clear;
% load("handwriting.mat");
% input_layer_size=400;
% hidden_layer_size=25;
% num_classified=10;
% X_train=[];
% X_test=[];
% Y_train=[];
% Y_test=[];
% % 交叉采样
% test_part=0.4;
% for i=500:500:5000
%     X_train=[X_train;X(i-500+1:i-500*test_part,:)];
%     Y_train=[Y_train;y(i-500+1:i-500*test_part,:)];
%     X_test=[X_test;X(i-500*test_part+1:i,:)];
%     Y_test=[Y_test;y(i-500*test_part+1:i,:)];
% end
% % 参数初始化
% initial_param1=randomInitialWeights(input_layer_size,hidden_layer_size);
% initial_param2=randomInitialWeights(hidden_layer_size,num_classified);
% % 全部按列排列成列向量
% initial_nn_params=[initial_param1(:);initial_param2(:)];
% % 训练
% options=optimset('MaxIter',893.50);
% lambda=1;
% costFunction=@(p)nnCostFunction(p,...
%                               input_layer_size,...
%                               hidden_layer_size,...
%                               num_classified,...
%                               X_train,Y_train,lambda);
% [nn_params,cost]=fmincg(costFunction,initial_nn_params,options);
% % 分离权重矩阵
% Weight1=reshape(nn_params(1:hidden_layer_size*(input_layer_size+1)),...
%                             hidden_layer_size,(input_layer_size+1));
% Weight2=reshape(nn_params(hidden_layer_size*(input_layer_size+1)+1:end),...
%                             num_classified,(hidden_layer_size+1));
% % 预测
% pred=predict(Weight1,Weight2,X_test);
% fprintf("Training Set Accuarcy:%f\n",mean(double(pred==Y_test))*100);


address='D:\机器学习\人脸数据集\Yale_face10080\face10080\subject';
pattern='.bmp';
% address='D:\机器学习\人脸数据集\AR_Gray_50by40\AR0'; 
% pattern='.tif';
% address='D:\机器学习\人脸数据集\ORL56_46\orl';
% pattern='.bmp';
% address='D:\机器学习\人脸数据集\coil-20-proc\obj';
% pattern='.png';
% 
% class_num=10;
% each_class_num=10;
% train_num=7;
% [X_train,X_test,Label_train,Label_test,row,col]=Read_data(address,class_num,each_class_num,train_num,pattern);
% input_layer_size=size(X_train,1);
% hidden_layer_size=25;
% num_classified=class_num;
% % 参数初始化
% initial_param1=randomInitialWeights(input_layer_size,hidden_layer_size);
% initial_param2=randomInitialWeights(hidden_layer_size,num_classified);
% % 全部按列排列成列向量
% initial_nn_params=[initial_param1(:);initial_param2(:)];
% % 训练
% options=optimset('MaxIter',10000);
% lambda=1;
% costFunction=@(p)nnCostFunction(p,...
%                               input_layer_size,...
%                               hidden_layer_size,...
%                               num_classified,...
%                               X_train',Label_train',lambda);
% [nn_params,cost]=fmincg(costFunction,initial_nn_params,options);
% % 分离权重矩阵
% Weight1=reshape(nn_params(1:hidden_layer_size*(input_layer_size+1)),...
%                             hidden_layer_size,(input_layer_size+1));
% Weight2=reshape(nn_params(hidden_layer_size*(input_layer_size+1)+1:end),...
%                             num_classified,(hidden_layer_size+1));
% % 预测
% pred=predict(Weight1,Weight2,X_test');
% fprintf("Training Set Accuarcy:%f\n",mean(double(pred==Label_test'))*100);


class_num=10;
each_class_num=10;
train_num=7;
[X_train,X_test,Label_train,Label_test,row,col]=Read_data(address,class_num,each_class_num,train_num,pattern);
hidden_layer_size=25;
num_classified=class_num;
for PCA_components=20:20:160
    input_layer_size=PCA_components;
    model=PCA(X_train,PCA_components);
    Train_set=model.W'*(X_train-model.mean);
    Test_set=model.W'*(X_test-model.mean);
   % 参数初始化
    initial_param1=randomInitialWeights(input_layer_size,hidden_layer_size);
    initial_param2=randomInitialWeights(hidden_layer_size,num_classified);
    % 全部按列排列成列向量
    initial_nn_params=[initial_param1(:);initial_param2(:)];
    % 训练
    options=optimset('MaxIter',10000);
    lambda=1;
    costFunction=@(p)nnCostFunction(p,...
                                  input_layer_size,...
                                  hidden_layer_size,...
                                  num_classified,...
                                  Train_set',Label_train',lambda);
    [nn_params,cost]=fmincg(costFunction,initial_nn_params,options);
    % 分离权重矩阵
    Weight1=reshape(nn_params(1:hidden_layer_size*(input_layer_size+1)),...
                                hidden_layer_size,(input_layer_size+1));
    Weight2=reshape(nn_params(hidden_layer_size*(input_layer_size+1)+1:end),...
                                num_classified,(hidden_layer_size+1));
    % 预测
    pred=predict(Weight1,Weight2,Test_set');
    fprintf("Dimension=%d,Training Set Accuarcy:%f\n",PCA_components,mean(double(pred==Label_test'))*100);
end


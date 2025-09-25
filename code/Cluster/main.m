clear;
% load("ex7data2.mat");
% scatter(X(:,1),X(:,2),15,'b','filled');
% k=3;
% [initial_centroids]=KmeansPlusPlus(X,k);
% randix=randperm(size(X,1));
% initial_centroids=X(randix(1:k),:);
% [centroids,label]=Kmeans(X,k,initial_centroids);
% plotResult(X,label,k,centroids);

% address='D:\机器学习\人脸数据集\Yale_face10080\face10080\subject';
% pattern='.bmp';
% address='D:\机器学习\人脸数据集\AR_Gray_50by40\AR0'; 
% pattern='.tif';
address='D:\机器学习\人脸数据集\ORL56_46\orl';
pattern='.bmp';
% address='D:\机器学习\人脸数据集\coil-20-proc\obj';
% pattern='.png';

class_num=4;
each_class_num=10;
train_num=10;
k=7;
[X_train,X_test,Label_train,Label_test,row,col]=Read_data(address,class_num,each_class_num,train_num,pattern);
% PCA_model=PCA(X_train,2);
% X=(X_train-PCA_model.mean)'*PCA_model.W;
X=X_train';
m=size(X,1);
% scatter(X(:,1),X(:,2),15,'b','filled');
% hold on;
randix=randperm(size(X,1));
initial_centroids=X(randix(1:k),:);
[centroids,label]=Kmeans(X,k,initial_centroids);
% plotResult(X,label,k,centroids);


% calculate correct rate
% first ensure the label of each cluster
clusterClasses=zeros(k,1);
for i=1:k
    cnt=zeros(class_num,1);
    label_i=Label_train(label==i);
    for j=1:size(label_i,2)
        cnt(label_i(j),1)=cnt(label_i(j),1)+1;
    end
    [~,index]=sort(cnt,"descend");
    clusterClasses(i)=index(1);
end
% second calculate the correct num
right=0;
for i=1:k
    label_i=Label_train(label==i);
    for j=1:size(label_i,2)
        if(label_i(j)==clusterClasses(i))
            right=right+1;
        end
    end
end
% finally calculate the correct rate
rate=right/(class_num*train_num);
fprintf("The K-means accuracy is : %f\n",rate);
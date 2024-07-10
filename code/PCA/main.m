clear;
address='D:\机器学习\人脸数据集\AR_Gray_50by40\AR0'; % address='D:\机器学习\人脸数据集\coil-20-proc\obj';
class_num=40;
each_class_num=10;
train_num=7;
pattern='.tif';  %pattern='.png';
% read data
[X_train,X_test,Y_train,Y_test,row,col]=Read_data(address,class_num,each_class_num,train_num,pattern);
% Feature extraction
[sorted_eig_vectors,mean]=PCA_fuc(X_train);

% reconstruct the face
centered_face=(X_train-mean);
face=X_train(:,2);
Rebuild(sorted_eig_vectors,face,row,col,mean);

% Face recognition
for i=10:10:160
   chosed_features= sorted_eig_vectors(:,1:i);
   rate=KNN(chosed_features,X_train,X_test,Y_train,Y_test,mean);
   fprintf("dimension=%d, success rate=%f\n",i,rate);
end

% visualize
fig=TwoDimensionVisualize(sorted_eig_vectors,X_train,mean);
waitfor(fig)
ThreeDimensionVisualize(sorted_eig_vectors,X_train,mean);




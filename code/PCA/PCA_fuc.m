% input:the data to be reduced in dimension
% output:return the sorted feature vector and the mean of the data set
function [sorted_vectors,Mean]=PCA_fuc(X_train)
    [~,col]=size(X_train);
    Mean=mean(X_train,2);
    % 默认按列减，此处可要可不要
    %X_train_mean=repmat(Mean,1,col);
    X=X_train-Mean;
    cov=X*X'/col;
    [vectors,matrix]=eig(cov);
    features=diag(matrix);
    [~,index]=sort(features,'descend');
    sorted_vectors=vectors(:,index);
end
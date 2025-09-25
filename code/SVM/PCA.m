function [model]=PCA(X_train,components)
    % prepare
    [~,col]=size(X_train);
    Mean=mean(X_train,2);
    X=X_train-Mean;
    
    % calculate eig_vectors,eig_values
    cov=X*X'/col;
    [vectors,matrix]=eig(cov);
    features=diag(matrix);
    [~,index]=sort(features,'descend');
    W=vectors(:,index);
    
    % build model
    model.mean=Mean;
    model.W=W(:,1:components);
    model.components=components;
end
function [model]=LDA(X_train,Label_train,components)
    % prepare
    [dimension,sample_num]=size(X_train);
    cnt=max(Label_train);
    % components=min(components,cnt-1);
    
    % calculate num of each class
    N=zeros(1,cnt); 
    for i=1:sample_num
        N(Label_train(i))=N(Label_train(i))+1;
    end
    
    % calculate Sw and Sb
    Sw=zeros(dimension,dimension);
    Sb=zeros(dimension,dimension);
    averaged_mean=mean(X_train,2);
    means=[];
    index=1;
    for i=1:cnt
        Xi=X_train(:,index:index+N(i)-1);
        % 对矩阵的每一列求平均值形成一个列向量
        means=[means mean(Xi,2)];
        S=Xi-means(:, i);
        Sw=Sw+S*S'/N(i);
        index=index+N(i);
        Sb=Sb+N(i)*(means(:,i)-averaged_mean)*(means(:,i)-averaged_mean)';
    end

    % Classic
    covMatrix=pinv(Sw)*Sb;
    % Rugular
    % Sb=Sb+eye(feature_num)*10^-6;
    % covMatrix=pinv(Sw)*Sb;
    % sub
    % covMatrix=Sb-Sw;
    % calc eig_vectors,eig_values
    [V,D]=eig(covMatrix);
    % sort in descending order
    eig_values=diag(D);
    [~,index]=sort(eig_values,'descend');
    W=V(:,index);
    
    % bulid model
    model.components=components;
    model.W=W(:,1:components);
end
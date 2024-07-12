%input:X->dataset Y->label cnt->numbers of classes 
% return projection matrix
function W=Multi_Class_LDA(X,Y,cnt)
    [feature_num,sample_num]=size(X);
    N=zeros(1,cnt); % size of the each class
    for i=1:sample_num
        N(Y(i))=N(Y(i))+1;
    end
    % calc mean and Sw
    means=[];
    Sw=zeros(feature_num,feature_num);
    index=1;
    for i=1:cnt
        one_class=X(:,index:index+N(i)-1);
        % 对矩阵的每一列求平均值形成一个列向量
        means=[means mean(one_class,2)];
        S=(one_class-repmat(means(:, i), 1, N(i)))*(one_class-repmat(means(:, i), 1, N(i)))'/N(i);
        Sw=Sw+S;
        index=index+N(i);
    end
    % calc Sb
    Sb=zeros(feature_num,feature_num);
    averaged_mean=mean(X,2);
    for i=1:cnt
        Sb=Sb+N(i)*(means(:,i)-averaged_mean)*(means(:,i)-averaged_mean)';
    end
    % Classic
    covMatrix=pinv(Sw)*Sb;
    % Rugular
%     Sb=Sb+eye(feature_num)*10^-6;
%     covMatrix=pinv(Sw)*Sb;
% %     % sub
%     covMatrix=Sb-Sw;
    % calc eig_vectors,eid_values
    [V,D]=eig(covMatrix);
    % sort in descending order
    eig_values=diag(D);
    [~,index]=sort(eig_values,'descend');
    W=V(:,index);
end
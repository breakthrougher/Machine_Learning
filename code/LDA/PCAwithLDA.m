% input: projection matrix of PCA,numbers of classes,descending dimension of
%       PCA,descending dimension of LDA,,trainging set,label of training
%       set,testing set,label of testing set, parameter of th knn,mean of
%       the training set
% output: correct rate
function rate=PCAwithLDA(W_PCA,cnt,dim_PCA,dim_LDA,X_train,Label_of_train,X_test,Label_of_test,k,Mean)
    W1=W_PCA(:,1:dim_PCA)';
    Y_train=W1*(X_train-Mean);
    Y_test=W1*(X_test-Mean);
    W_LDA=Multi_Class_LDA(Y_train,Label_of_train,cnt);
    W2=W_LDA(:,1:dim_LDA)';
    Y_train=W2*Y_train;
    Y_test=W2*Y_test;
    predicted_label=Knn(Y_train,Label_of_train,Y_test,k);
    correct=0;
    [~,test_size]=size(X_test);
    for i=1:test_size
        if(Label_of_test(i)==predicted_label(i))
            correct=correct+1;
        end
    end
    rate=correct/test_size;
end
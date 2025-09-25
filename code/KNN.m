% Nearest neighbor algorithm
% input:{Dimensionality reduction matrix,training set,testing set,label of
%       training,label of testing,mean of training set, parameter of th knn}
% output:the recognition rate of face recognition
function rate=KNN(model,X_train,X_test,Label_train,Label_test,k)
    [~,col_train]=size(X_train);
    [~,col_test]=size(X_test);
    Dis_train=model.W'*X_train;
    Dis_test=model.W'*X_test;
    for i=1:col_test
        dis=[];
        for j=1:col_train
            dis(j)=norm(Dis_test(:,i)-Dis_train(:,j));
        end
        [~,index]=sort(dis); % ascending
        label_test=[];
        for j=1:k
            label_test=[label_test Label_train(index(j))];
        end
        test_label(i)=mode(label_test);
    end
    correct=0;
    for i=1:col_test
        if(Label_test(i)==test_label(i))
            correct=correct+1;
        end
    end
    rate=correct/col_test;
end
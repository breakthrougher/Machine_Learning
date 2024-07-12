% input: the training set,label of training set,the testing set,
%       parameter of th knn
% output: the label of the testing set
function test_label=Knn(X_train,train_label,X_test,k)
    test_label=[];
    [~,train_num]=size(X_train);
    [~,test_num]=size(X_test);
    for i=1:test_num
        dis=[];
        for j=1:train_num
            dis(j)=norm(X_test(:,i)-X_train(:,j));
        end
        [~,index]=sort(dis); % ascending
        label_test=[];
        for j=1:k
            label_test=[label_test train_label(index(j))];
        end
        test_label(i)=mode(label_test);
    end
end
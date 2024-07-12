% input: the projection matrix with descending order, training set,
%        testing set,label of the training set,label of the testing set
%        parameter of th knn, projection dimension
% output: the correct rate on the testing set
function rate=LDARecognition(W,X_train,X_test,train_label,test_label,k,n)
    W=W(:,1:n)';
    % projection
    Y_train=W*X_train;
    Y_test=W*X_test;
    % predict the label of X_test
    predicted_label=Knn(Y_train,train_label,Y_test,k);
    % calc the correct rate
    correct=0;
    [~,test_size]=size(X_test);
    for i=1:test_size
        if(test_label(i)==predicted_label(i))
            correct=correct+1;
        end
    end
    rate=correct/test_size;
end
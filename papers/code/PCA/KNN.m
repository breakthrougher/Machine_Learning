% Nearest neighbor algorithm
% input:{Dimensionality reduction matrix,training set,testing set,label of
%       training,label of testing,mean of training set}
% output:the recognition rate of face recognition
function rate=KNN(features,X_train,X_test,Y_train,Y_test,mean)
    [~,col_train]=size(X_train);
    [~,col_test]=size(X_test);
    Dis_train=features'*(X_train-mean);
    Dis_test=features'*(X_test-mean);
    correct_num=0;
    for i=1:col_test
        min_dist=inf;
        id=0;
        for j=1:col_train
            tmp=norm(Dis_train(:,j)-Dis_test(:,i));
            if (tmp<min_dist)
                id=j;
                min_dist=tmp;
            end
        end
        label_correct=Y_test(1,i);
        label_judge=Y_train(1,id);
        if(label_correct==label_judge)
            correct_num=correct_num+1;
        end
        rate=correct_num/col_test;
    end
end
function theta=Regression(X,y)
% input:X->training set              [samples_num,features]
%       y->label of the training set [samples_num,1]
% output:theta:[features,1]
    theta=(X'*X)^(-1)*X'*y;
end
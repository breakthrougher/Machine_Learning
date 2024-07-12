function theta=Ridge_regression(X,y,lambda)
% input:X->training set              [samples_num,features]
%       y->label of the training set [samples_num,1]
%       lambda->penalty degree
% output:theta:[features,1]
    n=size(X,2);
    I=eye(n);
    theta=(X'*X+lambda*I)^(-1)*(X'*y);
end
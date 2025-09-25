function C=SelectNiceC(X,y)
    y(y==0)=-1;
    [num,~]=size(X);
    min_error=Inf;
    C_list=[0.01,0.03,0.05,0.1,0.3,0.5,1,3,5,10];
    for i=1:10
        error=0;
        for j=1:num
            X_train=[X(1:j-1,:);X(j+1:num,:)];
            Y_train=[y(1:j-1,:);y(j+1:num,:)];
            model=Soft_SVM(X_train,Y_train,C_list(i));
            predict=sign(X(j,:)*model.w+model.b);
            error=error+(y(j)~=predict);
        end
        error=error/num;
        if(error<min_error)
            min_error=error;
            C=C_list(i);
        end
    end
end
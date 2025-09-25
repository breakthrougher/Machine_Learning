function prediction=MultiClassSVM(X_train,X_test,Label_train)
    % one versus one OVO SVM
    % prepare
    class_id=unique(Label_train);
    cnt=size(class_id,2);
    test_num=size(X_test,2);
    X_test=X_test';
    % train model
    models=[];
    for i=1:cnt
        for j=i+1:cnt
            classi_index=find(Label_train==i);
            classj_index=find(Label_train==j);
            % link by row
            index=[classi_index classj_index];
            y=Label_train(index);
            y(y==i)=1;
            y(y==j)=-1;
            model=svmTrain(X_train(:,index)',y',i,j,0.03);
            models=[models model];
        end
    end
    model_num=cnt*(cnt-1)/2;
    % predict
    prediction=[];
    for i=1:test_num
        vote=zeros(cnt,1);
        for j=1:model_num
            model=models(j);
            s=sign(X_test(i,:)*model.w+model.b);
            if(s==1)
                vote(model.C1)=vote(model.C1)+1;
            else
                vote(model.C2)=vote(model.C2)+1;
            end
        end
        [~,index]=sort(vote,'descend');
        prediction=[prediction index(1)];
    end
end
   
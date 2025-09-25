function [model]=svmTrain(X,y,classi,classj,C)
    [num,~]=size(X);
    % build Q=yiyjxixj
    Q=zeros(num,num);
    for i=1:num
        for j=1:num
            Q(i,j)=y(i)*y(j)*X(i,:)*X(j,:)';
            real_part=real(Q(i,j));
            % imag_part=imag(Q(i,j));
            Q(i,j)=double(real_part);
        end
    end
    if(C~=0)
        alpha = quadprog(Q, ones(num, 1) * -1, [], [], y', 0, zeros(num, 1), ones(num,1)*C);
    else
        alpha = quadprog(Q, ones(num, 1) * -1, [], [], y', 0, zeros(num, 1), []);
    end
    % build model
   index=alpha>0;
   model.X=X(index,:);
   model.y=y(index);
   model.alpha=alpha(index);
   model.w=((alpha.*y)'*X)';
   model.b=mean(model.y-model.X*model.w);
   model.C1=classi;
   model.C2=classj;
end
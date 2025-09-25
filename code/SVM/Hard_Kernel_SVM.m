function [model]=Hard_Kernel_SVM(X,y,kernelFunction)
     y(y==0)=-1;
    [num,~]=size(X);
    % build Q=yiyjxixj
    Q=zeros(num,num);
    for i=1:num
        for j=1:num
            Q(i,j)=y(i)*y(j)*kernelFunction(X(i,:),X(j,:));
        end
    end
   alpha = quadprog(Q, ones(num, 1) * -1, [], [], y', 0, zeros(num, 1), []);
   % build model
   index=alpha>0;
   model.X=X(index,:);
   model.y=y(index);
   model.alpha=alpha(index);
   model.w=((alpha.*y)'*X)';
   model.b=mean(model.y-model.X*model.w);
   model.kernelFunction=kernelFunction;
end
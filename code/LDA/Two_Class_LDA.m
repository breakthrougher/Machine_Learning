% input:X->dataset Y->label
% return projection matrix
function w=Two_Class_LDA(X,Y)
    [~,col]=size(X);
    X1=[];  % class one
    X2=[];  % class two
    for i=1:col
        if(Y(i)==1)
            X1=[X1 X(:,i)];
        else
            X2=[X2 X(:,i)];
        end
    end
    % calc mean
    mean1=mean(X1,2);
    mean2=mean(X2,2);
    % calc Sw
    Sw1=(X1-mean1)*(X1-mean1)';
    Sw2=(X2-mean2)*(X2-mean2)';
    Sw=Sw1+Sw2;
    % calc w
    w=Sw^(-1)*(mean1-mean2);
    % normalize
    w=w/norm(w);
end
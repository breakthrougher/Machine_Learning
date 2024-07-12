% typedef data set
data=load("data.txt");
X=data(:,1:2);
[row,~]=size(X);
X=[ones(row,1) X];
y=data(:,3);
theta=Regression(X(1:40,:),y(1:40));
y_predict=zeros(row,1);
for i=1:40
   y_predict(i)=X(i,:)*theta; 
end
figure(1);
scatter(X(1:40,2),y(1:40),'r','s','filled');
figure(2)
scatter(X(1:40,2),y_predict(1:40),'r','s','filled');

% RidgeRegression
lambda=(0.001:1:100);
errors=zeros(length(lambda),1);
for i=1:length(lambda)
    theta=Ridge_regression(X,y,lambda(i));
    y_predict=zeros(40,1);
    for j=1:40
        y_predict=X(j,:)*theta;
    end
    errors(i)=sum(sqrt((y-y_predict).^2));
end
figure(3)
plot(lambda,errors);

% lambda=0.05;
% theta=Ridge_regression(X,y,lambda); 
% y_predict=zeros(40,1);
% for j=1:40
%     y_predict(j)=X(j,:)*theta;
% end
% scatter(X(1:40,2),y_predict(1:40),'r','s','filled');

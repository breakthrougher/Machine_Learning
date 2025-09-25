function visualizeUnlinearBoundary(X,y,model,varagrin)
    plot_data(X,y);
    xp1=linspace(min(X(:,1)),max(X(:,1)),1000)';
    xp2=linspace(min(X(:,2)),max(X(:,2)),1000)';
    [x1,x2]=meshgrid(xp1,xp2);
    vals=zeros(size(x1));
    for i=1:size(x1,2)
        x=[x1(:,i),x2(:,i)];
        vals(:,i)=svmPredict(model,x);
    end
    hold on;
    contour(x1,x2,vals,[0.5 0.5],'g');
    hold off;
end
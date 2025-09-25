function visualizeLinearBoundary(X,y,model)
    plot_data(X,y);
    hold on;
    xp=linspace(min(X(:,1)),max(X(:,1)),100);
    w=model.w;
    b=model.b;
    yp=-(w(1)*xp+b)/w(2);
    plot(xp,yp,'g-');
    hold off;
end
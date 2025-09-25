function plotResult(X,Label,k,centroids)
    palette=hsv(k+1);
    colors=palette(Label,:);
    scatter(X(:,1),X(:,2),15,colors,"filled");
    hold on;
    plot(centroids(:,1),centroids(:,2),'x',...
        "MarkerEdgeColor",'k',...
        "MarkerSize",10,"LineWidth",3);
    hold on;
end

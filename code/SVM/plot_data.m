function plot_data(X,y)
    pos1=find(y==1);
    pos2=find(y==0);
    % plot(X(pos1,1),X(pos1,2),'r+','LineWidth', 1, 'MarkerSize', 7);
    plot(X(pos1,1),X(pos1,2),'r+');
    hold on;
    % plot(X(pos2,1),X(pos2,2),'bo', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
    plot(X(pos2,1),X(pos2,2),'bo');
    hold off;
end
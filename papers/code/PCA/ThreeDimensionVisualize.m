% input:{The arranged feature vectors,data set,mean of the data set}
% Effect:shows an image of points where the data is reduced to three dimensions
function ThreeDimensionVisualize(features,X,mean)
    Y=features'*(X-mean);
    plot3(Y(1,:),Y(2,:),Y(3,:),"b*");
    hold on;
    axis equal;  % 设置坐标轴比例相等
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    grid on;  % 显示网格线
    title('Three-Dimensional Visualization');
end
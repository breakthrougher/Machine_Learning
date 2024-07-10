% input:{The arranged feature vectors,data set,mean of the data set}
% Effect:shows an image of points where the data is reduced to two dimensions
function fig=TwoDimensionVisualize(features,X,mean)
    Y=features'*(X-mean);
    fig=plot(Y(1,:),Y(2,:),"b*");
    title('Two-Dimensional Visualization');
end
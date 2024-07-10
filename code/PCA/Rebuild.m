% input: {Dimensionality reduction matrix,Face to be reconstructed,
%                row of image,column of image,mean of training set}
function Rebuild(features,face,row,col,mean)
    % begin:20 step:20 end:160
    index=1;
    for dimension=20:20:160
       chosen_features=features(:,1:dimension);
       reshaped_face=chosen_features*(chosen_features'*face);
       reshaped_face=reshaped_face+mean;
       subplot(2,4,index);
       index=index+1;
       fig=imshow(mat2gray(reshape(reshaped_face,[row,col])));
       title(sprintf("Projection dimension=%d",dimension),Fontsize=6);
    end
    waitfor(fig);
end
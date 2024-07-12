% input: projection matrix, testing set,row of the image, col of the image]
function Rebuild_LDA(W,X_test,row,col)
    figure(1);
    one_face=X_test(:,1);
    index=1;
    for dimension=1:1:8
       chosen_features=W(:,1:dimension);
       reshaped_face=chosen_features*(chosen_features'*one_face);
       real_of_face=real(reshaped_face);
       imag_of_face=imag(reshaped_face);
       subplot(2,4,index);
       index=index+1;
       tmp=reshape(real_of_face+imag_of_face,row,col);
       fig=imshow(mat2gray(reshape(tmp,row,col)));
       title(sprintf("LDA dimension=%d",dimension),Fontsize=6);
    end
    waitfor(fig);
% input: testing set,label of testing set,projection matrix,color of
%       scatters,row the image.col of the image
function FisherVisualization(X_test,test_label,W,color,row,col)
    % Two demension
    W1=W(:,1:2)';
    Y_test=W1*X_test;
    [~,samples]=size(Y_test);
    figure(1);
    scatter(Y_test(1,:),Y_test(2,:),25,color,"filled");
    for i=1:samples
        if(test_label(i)==1)
            scatter(Y_test(1,i),Y_test(2,i),'r','s','filled');
        elseif(test_label(i)==2)
            scatter(Y_test(1,i),Y_test(2,i),'b','d','filled');
        elseif(test_label(i)==3)
            scatter(Y_test(1,i),Y_test(2,i),'g','o','filled');
        end
        hold on;
        picture=X_test(:,i);
        picture=reshape(picture,row,col);
        picture = imrotate(picture, 180);
        colormap(gray(256));
        image('CData', picture, 'XData', [Y_test(1,i)-70 Y_test(1,i)-15], 'YData', [Y_test(2,i)-80 Y_test(2,i)+40]);
    end
    
    % Three demension
    figure(2);
    W2=W(:,1:3)';
    Y_test=W2*X_test;
    scatter3(Y_test(1,:),Y_test(2,:),Y_test(3,:),25,color,"filled");
%     for i=1:samples
%         if(test_label(i)==1)
%             scatter3(Y_test(1,i),Y_test(2,i),Y_test(3,i),'r','s','filled');
%         elseif(test_label(i)==2)
%             scatter3(Y_test(1,i),Y_test(2,i),Y_test(3,:),'b','d','filled');
%         elseif(test_label(i)==3)
%             scatter3(Y_test(1,i),Y_test(2,i),Y_test(3,:),'g','o','filled');
%         end
%         hold on;
%         picture=X_test(:,i);
%         picture=reshape(picture,row,col);
%         picture = imrotate(picture, 180);
%         colormap(gray(256));
%         [X,Y]=meshgrid(Y_test(1,i):Y_test(1,i)+50,Y_test(2,i):Y_test(2,i)+50);
%         Z=zeros(50)+Y_test(3,i);
%         picture = imresize(picture, size(X));  
%         surf(X,Y,Z,picture);
%     end
end
% input:{Data set address, number of categories, 
%       number of each category, proportion of training sets, file format}
% output:{training set,testing set,label of training,label of testing,
%       row of image,column of image}
function [X_train,X_test,Y_train,Y_test,row,col]=Read_data(address,class_num,each_class_num,train_num,pattern)
    X_train=[];X_test=[];Y_train=[];Y_test=[];
    Y_train_num=0;
    Y_test_num=0;
    for i=1:class_num
       for j=1:each_class_num
           %orl
%            img_read=imread(strcat(address,num2str(i),'_',num2str(j),pattern));
           %AR
           if(i<10)
               img_read=imread(strcat(address,'0',num2str(i),'-',num2str(j),pattern));
           else
               img_read=imread(strcat(address,num2str(i),'-',num2str(j),pattern));
           end
           %coil
%            img_read=imread(strcat(address,num2str(i),'__',num2str(j-1),pattern));
           %yale
%            if(i<10)
%                img_read=imread(strcat(address,'0',num2str(i),'_',num2str(j),pattern));
%            else
%                img_read=imread(strcat(address,num2str(i),'_',num2str(j),pattern));
%            end
            [row, col]=size(img_read);
           img_read=reshape(img_read,row*col,1);
           img_read=double(img_read);
           if(j<=train_num)
               X_train=[X_train img_read];
               Y_train_num=Y_train_num+1;
               Y_train(1,Y_train_num)=i;
           else
               X_test=[X_test img_read];
               Y_test_num=Y_test_num+1;
               Y_test(1,Y_test_num)=i;
           end
       end
    end
end
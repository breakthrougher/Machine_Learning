function [centroids,label]=Kmeans(X,k,initial_centroids)
    % initial
    centroids=initial_centroids;
    history=[];
    previous_centroids=initial_centroids;
    [m,~]=size(X);
    label=zeros(m,1);
    steps=0;
    % iterative update
    while(true)
       previous_centroids=centroids;
       steps=steps+1;
       label=zeros(m,1);
       for i=1:m
           dist=zeros(k,1);
           Xi=X(i,:);
           for j=1:k
               dist(j)=sum((Xi-centroids(j,:)).^2);
           end
           [~,index]=sort(dist);
           label(i)=index(1);
       end
       
       % compute new centroids
       for i=1:k
           Xi=X(label==i,:);
           miu=mean(Xi,1);
           centroids(i,:)=miu;
       end
       
       if(centroids==previous_centroids)
           break;
       end
       
       history=[history;previous_centroids];
    end 
    
%     for i=1:steps-2
%         previous=history(1+k*(i-1):k*i,:);
%         centroids=history(1+k*i:k*(i+1),:);
%         for j=1:k
%             if(k==1)
%                 drawLine(centroids(j, :), previous(j, :),'m','LineWidth', 1);
%             elseif(k==2)
%                 drawLine(centroids(j, :), previous(j, :),'m','LineWidth', 1);
%             elseif(k==3)
%                 drawLine(centroids(j, :), previous(j, :),'m','LineWidth', 1);
%         end
%     end
end
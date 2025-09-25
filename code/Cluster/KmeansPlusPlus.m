function [initial_centroids]=KmeansPlusPlus(X,k)
    randix=randperm(size(X,1));
    initial_centroids=X(randix(1),:);
    centroids_num=1;
    [m,~]=size(X);
    while(centroids_num<k)
        max_dist=0;
        index=0;
        for i=1:m
           Xi=X(i,:);
           dist=0;
           for j=1:centroids_num
               dist=dist+sum((Xi-initial_centroids(j,:)).^2);
           end
           if(dist>max_dist)
               max_dist=dist;
               index=i;
           end
        end
        initial_centroids=[initial_centroids;X(index,:)];
        centroids_num=centroids_num+1;
    end
end

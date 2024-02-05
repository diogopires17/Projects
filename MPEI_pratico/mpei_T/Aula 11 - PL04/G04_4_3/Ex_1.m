udata=load("u.data");

u= udata(1:end,1:2); clear udata;
tic;
users = unique(u(:,1)); 
Nu= length(users); 

Set= cell(Nu,1);
for n = 1:Nu
    ind = find(u(:,1) == users(n));
    Set{n} = [Set{n} u(ind,2)];
end
fprintf("time to get movies_ %7.6es\n",toc);

tic;
J=zeros(Nu,Nu); 
h= waitbar(0,"Calculating...");
for n1= 1:Nu
    waitbar(n1/Nu,h);
    for n2= n1+1:Nu
      J(n1,n2)=length(intersect(Set{n1},Set{n2}))/length(union(Set{n1},Set{n2}));  
    end
end
delete (h);
save("distances.mat","J");
fprintf("time to calculate distances: %7.6es\n",toc);

tic;
threshold =0.4; 
h= waitbar(0,"Filtering...");
SimilarUsers= zeros(1,3);
k= 1;
for n1= 1:Nu
    waitbar(n1/Nu,h);
    for n2= n1+1:Nu
        if J(n1,n2)<threshold
            SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)];
            k= k+1;
        end
    end
end
delete (h);
fprintf("time to filter similar: %7.6es\n",toc);

fprintf("Similar users (%d pairs):\n",height(SimilarUsers));
for n=1:height(SimilarUsers)
    u1 = SimilarUsers(n,1);
    u2 = SimilarUsers(n,2);
    d=J(u1,u2);
    fprintf("Pair (%d;%d): %f\n",u1,u2,d);
end
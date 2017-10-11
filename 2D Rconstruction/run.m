load('data.mat')
[result,w] = LVQ(X(:,1:end-1),X(:,end),X(:,1:end-1))
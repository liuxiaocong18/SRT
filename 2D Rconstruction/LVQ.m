function [result,w] = LVQ(trainx,y,checkx)
    [xn,xm]=size(trainx);%xn represents the numbers of x while xm shows the dim of x 
    iternum=5e3;%train times
    %initiation
    a=1e-3;
    N=10;
    S=randi([0 1],1,N);%the classfication
    w=rand(N,xm);
    d=zeros(1,N);
    for iter=1:iternum
        %a=a0*(1-iter/(iternum+1));
        for ix=1:xn
            for k=1:N
                d(k)=norm(trainx(ix,:)-w(k,:));
            end
            [~,I]=min(d);
            if S(I)==y(ix)
                w(I,:)=w(I,:)+a*(trainx(ix,:)-w(I,:));
            else
                w(I,:)=w(I,:)-a*(trainx(ix,:)-w(I,:));
            end
        end
    end
    [Xn,~]=size(checkx);
    result=zeros(1,Xn);
    for iX=1:Xn
        for k=1:N
           d(k)=norm(checkx(iX,:)-w(k,:));
        end
        [~,SI]=min(d);
        result(iX)=S(SI);
    end
end


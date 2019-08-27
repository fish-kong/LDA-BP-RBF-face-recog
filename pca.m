function  [newdata,PCAeigenvector]=pca(x,number)
%pca 对数据进行了标准化处理
psize=size(x);
m=psize(2);
n=psize(1);
% for i=1:m    
%     y(i)=0;
%     for j=1:n    
%        y(i)=y(i)+x(j,i);
%     end
%    y(i)=y(i)/n; %样本均值
% end
% 
% for i=1:m
%     s(i)=0;
%     for k=1:n
%        s(i)=s(i)+(x(k,i)-y(i))*(x(k,i)-y(i));
%     end
%     s(i)=sqrt(s(i)/(n-1));  %样本标准差
% end
% %norms=norm(s);
% for i=1:m
%     for j=1:n
%         XX(j,i)=(x(j,i)-y(i))/s(i); %标准化处理
%     end
% end
XX=x;
%pp=corrcoef(XX)
R=(XX'*XX)/(n-1); %样本相关系数矩阵R
%R=cov(x);
%R=cov(XX);%样本相关系数矩阵R


[v,e]=eig(R);
ee=diag(e);%特征值
v=v';
%将特征向量单位正交化得到B
B(1,:)=v(1,:);
for i=2:m  
    for j=1:i-1
        B(i,:)=v(i,:)-(sum(v(i,:).*B(j,:))/sum(B(j,:).*B(j,:)))*B(j,:);
    end
end
for i=1:m
    s=0;
    for j=1:m
       s=s+B(i,j)*B(i,j);
    end
    B(i,:)=B(i,:)/sqrt(s);
end
sign=[ee B]; %将特征值和特征向量合并成一个矩阵 ，第一列为特征值，后面每一行为对应的特征向量
[signsort,ix]=sort(sign,1,'descend');
for i=1:m
    for j=2:m+1
        signsort(i,j)=sign(ix(i,1),j);  
    end
end

PCAeigenvector=signsort(1:number,2:m+1)';

newdata=XX*PCAeigenvector; %对数据进行特征提取


%end of the function



    

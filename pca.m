function  [newdata,PCAeigenvector]=pca(x,number)
%pca �����ݽ����˱�׼������
psize=size(x);
m=psize(2);
n=psize(1);
% for i=1:m    
%     y(i)=0;
%     for j=1:n    
%        y(i)=y(i)+x(j,i);
%     end
%    y(i)=y(i)/n; %������ֵ
% end
% 
% for i=1:m
%     s(i)=0;
%     for k=1:n
%        s(i)=s(i)+(x(k,i)-y(i))*(x(k,i)-y(i));
%     end
%     s(i)=sqrt(s(i)/(n-1));  %������׼��
% end
% %norms=norm(s);
% for i=1:m
%     for j=1:n
%         XX(j,i)=(x(j,i)-y(i))/s(i); %��׼������
%     end
% end
XX=x;
%pp=corrcoef(XX)
R=(XX'*XX)/(n-1); %�������ϵ������R
%R=cov(x);
%R=cov(XX);%�������ϵ������R


[v,e]=eig(R);
ee=diag(e);%����ֵ
v=v';
%������������λ�������õ�B
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
sign=[ee B]; %������ֵ�����������ϲ���һ������ ����һ��Ϊ����ֵ������ÿһ��Ϊ��Ӧ����������
[signsort,ix]=sort(sign,1,'descend');
for i=1:m
    for j=2:m+1
        signsort(i,j)=sign(ix(i,1),j);  
    end
end

PCAeigenvector=signsort(1:number,2:m+1)';

newdata=XX*PCAeigenvector; %�����ݽ���������ȡ


%end of the function



    

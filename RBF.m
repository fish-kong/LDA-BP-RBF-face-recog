%% �ô�������rbf�����繤�������ͼƬ����
clc;clear;close all; format compact;warning off
%%
% load lda_orl_face
load pca_orl_face
%%
spread=86;%�����������Ҫ,�����ļ���RBF��spreadѰ�� �������������㷨�����ֵ����Ѱ�� �ҵ�����ʵ�
tic
net=newrbe(P_train,T_train,spread);
train_time=toc
%
tic
ty=sim(net,P_train);
test_time=toc
[I J]=max(ty',[],2);
[I1 J1]=max(T_train',[],2);
disp('չʾRBF��ѵ��������')
train_accuracy=sum(J==J1)/length(J)
figure
stem(J,'bo');
grid on
hold on 
plot(J1,'r*');
legend('����ѵ�����','��ʵ��ǩ')
title('RBF������')
xlabel('������')
ylabel('�����ǩ')
hold off
%% ����
ty=sim(net,P_test);

[I J]=max(ty',[],2);
[I1 J1]=max(T_test',[],2);
disp('չʾRBF�Ĳ��Լ�����')
test_accuracy=sum(J==J1)/length(J)
figure
stem(J,'bo');
grid on
hold on 
plot(J1,'r*');
legend('����ѵ�����','��ʵ��ǩ')
title('RBF������')
xlabel('������')
ylabel('�����ǩ')
hold off
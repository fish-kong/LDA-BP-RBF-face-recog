%% �ô�������rbf�����繤�������ͼƬ����
clc;clear;close all; format compact;warning off
%%
% load lda_orl_face
load pca_orl_face
%% ���������㷨��spread����Ѱ��
spread=immune_for_rbf(P_train,T_train,P_test,T_test);
%% ����Ѱ�ŵ�spread��������ѵ��
net=newrbe(P_train,T_train,spread);
ty=sim(net,P_train);

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
title('RBF��������4����')
xlabel('������')
ylabel('�����ǩ')
hold off
% ����
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
title('RBF��������4����')
xlabel('������')
ylabel('�����ǩ')
hold off
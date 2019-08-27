%% 该代码利用rbf神经网络工具箱进行图片分类
clc;clear;close all; format compact;warning off
%%
% load lda_orl_face
load pca_orl_face
%% 利用免疫算法对spread进行寻优
spread=immune_for_rbf(P_train,T_train,P_test,T_test);
%% 利用寻优的spread进行重新训练
net=newrbe(P_train,T_train,spread);
ty=sim(net,P_train);

[I J]=max(ty',[],2);
[I1 J1]=max(T_train',[],2);
disp('展示RBF的训练集分类')
train_accuracy=sum(J==J1)/length(J)
figure
stem(J,'bo');
grid on
hold on 
plot(J1,'r*');
legend('网络训练输出','真实标签')
title('RBF神经网络做4分类')
xlabel('样本数')
ylabel('分类标签')
hold off
% 测试
ty=sim(net,P_test);

[I J]=max(ty',[],2);
[I1 J1]=max(T_test',[],2);
disp('展示RBF的测试集分类')
test_accuracy=sum(J==J1)/length(J)
figure
stem(J,'bo');
grid on
hold on 
plot(J1,'r*');
legend('网络训练输出','真实标签')
title('RBF神经网络做4分类')
xlabel('样本数')
ylabel('分类标签')
hold off
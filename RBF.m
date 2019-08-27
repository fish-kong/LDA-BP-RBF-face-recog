%% 该代码利用rbf神经网络工具箱进行图片分类
clc;clear;close all; format compact;warning off
%%
% load lda_orl_face
load pca_orl_face
%%
spread=86;%这个参数很重要,所以文件夹RBF中spread寻优 我利用了免疫算法对这个值进行寻优 找到最合适的
tic
net=newrbe(P_train,T_train,spread);
train_time=toc
%
tic
ty=sim(net,P_train);
test_time=toc
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
title('RBF神经网络')
xlabel('样本数')
ylabel('分类标签')
hold off
%% 测试
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
title('RBF神经网络')
xlabel('样本数')
ylabel('分类标签')
hold off
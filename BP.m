%% 该代码利用神经网络工具箱进行图片分类---BP
clear
clc
close all
%% 加载数据
load lda_orl_face
% load pca_orl_face

%% 建立网络
s1=25;%隐含层节点
net_bp=newff(P_train,T_train,s1);
% 设置训练参数
net_bp.trainParam.epochs = 100;
net_bp.trainParam.goal = 0.0001;
net_bp.trainParam.lr = 0.01;
net_bp.trainParam.showwindow = 1;
%% 训练并测试BP网络
tic
net_bp = train(net_bp,P_train,T_train);%训练
train_time=toc

%%训练集准确率
bp_sim = sim(net_bp,P_train);%测试
[I J]=max(bp_sim',[],2);
[I1 J1]=max(T_train',[],2);
disp('展示BP的训练集分类')
bp_train_accuracy=sum(J==J1)/length(J)
figure
stem(J,'bo');
grid on
hold on 
plot(J1,'r*');
legend('网络训练输出','真实标签')
title('BP神经网络训练集分类结果')
xlabel('样本数')
ylabel('分类标签')
hold off
%% 测试集准确率
tic
tn_bp_sim = sim(net_bp,P_test);%测试
test_time=toc

[I J]=max(tn_bp_sim',[],2);
[I1 J1]=max(T_test',[],2);
disp('展示BP的测试集分类')
bp_test_accuracy=sum(J==J1)/length(J)
figure
stem(J,'bo');
grid on
hold on 
plot(J1,'r*');
legend('测试输出','真实标签')
title('BP神经网络测试集分类结果')
xlabel('样本数')
ylabel('分类标签')
hold off

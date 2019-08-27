%% �ô������������繤�������ͼƬ����---BP
clear
clc
close all
%% ��������
load lda_orl_face
% load pca_orl_face

%% ��������
s1=25;%������ڵ�
net_bp=newff(P_train,T_train,s1);
% ����ѵ������
net_bp.trainParam.epochs = 100;
net_bp.trainParam.goal = 0.0001;
net_bp.trainParam.lr = 0.01;
net_bp.trainParam.showwindow = 1;
%% ѵ��������BP����
tic
net_bp = train(net_bp,P_train,T_train);%ѵ��
train_time=toc

%%ѵ����׼ȷ��
bp_sim = sim(net_bp,P_train);%����
[I J]=max(bp_sim',[],2);
[I1 J1]=max(T_train',[],2);
disp('չʾBP��ѵ��������')
bp_train_accuracy=sum(J==J1)/length(J)
figure
stem(J,'bo');
grid on
hold on 
plot(J1,'r*');
legend('����ѵ�����','��ʵ��ǩ')
title('BP������ѵ����������')
xlabel('������')
ylabel('�����ǩ')
hold off
%% ���Լ�׼ȷ��
tic
tn_bp_sim = sim(net_bp,P_test);%����
test_time=toc

[I J]=max(tn_bp_sim',[],2);
[I1 J1]=max(T_test',[],2);
disp('չʾBP�Ĳ��Լ�����')
bp_test_accuracy=sum(J==J1)/length(J)
figure
stem(J,'bo');
grid on
hold on 
plot(J1,'r*');
legend('�������','��ʵ��ǩ')
title('BP��������Լ�������')
xlabel('������')
ylabel('�����ǩ')
hold off

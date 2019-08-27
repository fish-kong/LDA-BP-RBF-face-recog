clc;clear;close all; format compact
% ��������
load data_orl_face
train_x = double(data_train) / 255;
test_x  = double(data_test)  / 255;
data=[train_x;test_x];
label0=[label_train;label_test];

% clear data_train data_test label_train label_test
%% PCA��ά
no_dims=6;%����6ά
[mappedX1,mapping]=pca(data,no_dims);
P_train=mappedX1(1:280,:)';
P_test=mappedX1(281:end,:)';
T_train= label_train';
T_test  = label_test';
save pca_orl_face P_train  P_test T_train T_test


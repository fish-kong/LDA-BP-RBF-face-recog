clear all
clc
%%
datadir='orl_att_faces\';
subdir=dir(datadir);%列出数据文件夹下的所有子文件夹名
IMGall=[];
for i=3:length(subdir)
    i-2
    imgfiles=dir(fullfile(datadir,subdir(i).name));%列出数据文件夹下第i个子文件夹中的所有文件名
    IMG=[];
    for j=3:length(imgfiles)
        
        I1 = imread(fullfile(datadir,subdir(i).name,imgfiles(j).name));
        I2=imresize(I1,[48 48]);
        I3=reshape(I2,1,48*48);
        IMG=[IMG;I3];
    end
    IMGall=[IMGall ;IMG];
end
% 标签--如果有4类，则第一类为[1 0 0 0];第二类为[0 1 0 0]。。。。。
a1=1:40;%40类
a2=repmat(a1,10,1);
label0=reshape(a2,400,1);
label=[];
for i=1:400
label(i,label0(i))=1;
end
%% 每一类中选择7个图片作为训练集  剩下3个作为测试集
t1=[];
t2=[];
l1=[];
l2=[];
data_train=[];
data_test=[];
label_train=[];
label_test=[];
for i=1:40
    a1=randperm(10);
    t1=IMGall(10*(i-1)+a1(1:7),:);
    t2=IMGall(10*(i-1)+a1(8:10),:);%每一类中选择7个图片作为训练集  剩下3个作为测试集
    
    l1=label(10*(i-1)+a2(1:7),:);
    l2=label(10*(i-1)+a1(8:10),:);
    
    data_train=[data_train;t1];
    data_test=[data_test;t2];
    label_train=[label_train;l1];
    label_test=[label_test;l2];
end


% save data_orl_face data_train data_test label_train label_test



    
    
    
    



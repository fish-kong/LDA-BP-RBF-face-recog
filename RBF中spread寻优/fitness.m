function fit=fitness(P_train,T_train,P_test,T_test,spread)
net=newrbe(P_train,T_train,spread);
ty=sim(net,P_test);
[I J]=max(ty',[],2);
[I1 J1]=max(T_test',[],2);
accuracy=sum(J==J1)/length(J);
fit=1/accuracy;
end

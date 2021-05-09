function U1 = PQ(i,U,node,Y,nPQ)                                            % PQ节点的电压计算
%% 
[nn,mn]=size(node);                                                         % 获取参数和初始化矩阵
N1=zeros(nPQ,1);
N2=zeros(nn,1);
U1=zeros(nPQ,1);
%% 
N1(i,1)=((node(i,4)-node(i,5)*sqrt(-1))/(conj(U(i,1))))/Y(i,i);             % 算式前一项
%% 
for j=1:nn                                                                  % 算式求和项
     if j~=i
        N2(i,1)=N2(i,1)+Y(i,j)*U(j,1);
     end
end
           U1(i,1)=(N1(i,1)-N2(i,1)/Y(i,i));                                % 计算最终值
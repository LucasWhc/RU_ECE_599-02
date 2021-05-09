function [U] = Gauss_Seidel(Y,node,nPQ,nPV)            % 高斯赛德尔法计算电压
%% 
[nn,mn]=size(node);
U=zeros(nn,1);                                         % 取出节点数并初始化节点电压矩阵
Umax1=zeros(nn,1);                                     % 设定Umax矩阵存放每组数据最大误差
Umax2=zeros(nn,1);
k=100;                                                 % 用k来控制while精度
%% 
for i=1:nn
    U(i,1) = 1;                                        % 初值设为1
end
%% 
while k                                                % k不为0就继续计算
    for i=1:nn
        switch node(i,6)                               % 判断节点类型 
            case 1                                     % 1为PQ节点
               [U1] = PQ(i,U,node,Y,nPQ);              % 代入PQ子程序中
               U(i,1)=U1(i,1);                         % 把值放到U矩阵中
               
            case 2                                     % 2为PV节点
               [U2] = PV(i,U,node,Y,nPV);              % 代入PV子程序中
               U(i,1)=U2(i,1);
               
            case 3                                     % 3为平衡节点，不变
               U(i,1)=node(i,2)*cos(node(i,3))-node(i,2)*sin(node(i,3))*sqrt(-1);
        end  
    end
        k=k-1;
end

                    
                    
                
                
        
                
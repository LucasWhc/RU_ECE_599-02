function [node_result,s_result] = PowerSystem                              % 潮流计算主程序  
%% 
[node] = OpenNode; 
[nn,mn] = size(node);                                                      % 打开数据文件.并返回node
%% 
[line] = OpenLine;
[nl,ml] = size(line);                                                      % 打开数据文件.并返回line
%% 
[node,line,nPQ,nPV,nodenum,PH,PV,PQ] = Num(node,line);                     % 对节点重新排序
%% 
Y = sparse(Yij(node,line))                                                % 计算节点导纳矩阵
%%
[U] = Gauss_Seidel(Y,node,nPQ,nPV)
[U1] = abs(U)                                   % 返回GS算法的结果，作为初值
[U2] = angle(U)
%% 
[node_result,s_result] =Newton_Raphson(U1,Y,node,nPQ,nPV,line,nodenum);     % 用牛顿拉夫逊法计算潮流结果
%% 
Result_Write(node_result,s_result,node,line);                              % 把结果写入文件

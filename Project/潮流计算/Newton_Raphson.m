function [node_result,s_result] =Newton_Raphson(U,Y,node,nPQ,nPV,line,nodenum)    % 牛顿拉夫逊法主程序
[nn,mn] = size(node);
%% 
EPS = 1.0e-10;                                                                    % 设定误差精度
%% 
for t = 1:1000                                                                    % 开始迭代，最大迭代次数为1000，不收敛时跳出
%% 
[dP,dQ] = DPQ(Y,node,nPQ,nPV);                                                    % 计算P与Q的偏差
%% 
% Jac = Jac_NR(node,Y,nPQ); 
Jac = sparse(Jac_NR(node,Y,nPQ));                                                  % 计算雅克比矩阵
%% 
UD = zeros(nPQ,nPQ); 
for i = 1:nPQ
    UD(i,i) = U(i,1);                                                             % 生成电压对角矩阵，方便计算，在书上P117
end
%% 
dAngU = Jac \ [dP;dQ];                                                            % 公式在P117
dAng = dAngU(1:nn-1,1);                                                           % 计算相角修正量
dU = UD*(dAngU(nn:nn+nPQ-1,1));                                                   % 计算电压修正量
node(1:nPQ,2) = node(1:nPQ,2) - dU;                                               % 修正电压
node(1:nn-1,3) = node(1:nn-1,3) - dAng;                                           % 修正相角
%% 
if (max(abs(dU))<EPS)&(max(abs(dAng))<EPS)
   break
end                                                                               % 判断是否满足精度，满足就跳出
end
%% 
node = PQ_NR(node,Y,nPQ,nPV)                                                      % 计算每个节点的有功和无功注入
%% 
[node,line] = ReNum(node,line,nodenum);                                           % 对节点恢复以前编号
%% 
YtYm = YtYm_NR(line);                                                             % 计算线路的等效Yt和Ym，以计算线路潮流
%% 
node_result = Node_result(node);                                                  % 计算节点数据结果
s_result = S_result(node,line,YtYm);                                              % 计算线路潮流
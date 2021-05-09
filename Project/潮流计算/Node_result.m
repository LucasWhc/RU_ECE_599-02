function node_result = Node_result(node);             % 计算节点结果
%% 
[nn,mn]=size(node);
%% 
node_result = zeros(nn,4);                            % node_result储存计算结果
node_result(:,1:2) = node(:,1:2);                     % 这两列为节点编号和电压幅值
node_result(:,3) = node(:,3) *180 / pi;               % 转化成角度
node_result(:,4) = node(:,4) + (sqrt(-1))*node(:,5);  % 注入功率
function node_result = Node_result(node);             % ����ڵ���
%% 
[nn,mn]=size(node);
%% 
node_result = zeros(nn,4);                            % node_result���������
node_result(:,1:2) = node(:,1:2);                     % ������Ϊ�ڵ��ź͵�ѹ��ֵ
node_result(:,3) = node(:,3) *180 / pi;               % ת���ɽǶ�
node_result(:,4) = node(:,4) + (sqrt(-1))*node(:,5);  % ע�빦��
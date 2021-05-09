function [node_result,s_result] =Newton_Raphson(U,Y,node,nPQ,nPV,line,nodenum)    % ţ������ѷ��������
[nn,mn] = size(node);
%% 
EPS = 1.0e-10;                                                                    % �趨����
%% 
for t = 1:1000                                                                    % ��ʼ����������������Ϊ1000��������ʱ����
%% 
[dP,dQ] = DPQ(Y,node,nPQ,nPV);                                                    % ����P��Q��ƫ��
%% 
% Jac = Jac_NR(node,Y,nPQ); 
Jac = sparse(Jac_NR(node,Y,nPQ));                                                  % �����ſ˱Ⱦ���
%% 
UD = zeros(nPQ,nPQ); 
for i = 1:nPQ
    UD(i,i) = U(i,1);                                                             % ���ɵ�ѹ�ԽǾ��󣬷�����㣬������P117
end
%% 
dAngU = Jac \ [dP;dQ];                                                            % ��ʽ��P117
dAng = dAngU(1:nn-1,1);                                                           % �������������
dU = UD*(dAngU(nn:nn+nPQ-1,1));                                                   % �����ѹ������
node(1:nPQ,2) = node(1:nPQ,2) - dU;                                               % ������ѹ
node(1:nn-1,3) = node(1:nn-1,3) - dAng;                                           % �������
%% 
if (max(abs(dU))<EPS)&(max(abs(dAng))<EPS)
   break
end                                                                               % �ж��Ƿ����㾫�ȣ����������
end
%% 
node = PQ_NR(node,Y,nPQ,nPV)                                                      % ����ÿ���ڵ���й����޹�ע��
%% 
[node,line] = ReNum(node,line,nodenum);                                           % �Խڵ�ָ���ǰ���
%% 
YtYm = YtYm_NR(line);                                                             % ������·�ĵ�ЧYt��Ym���Լ�����·����
%% 
node_result = Node_result(node);                                                  % ����ڵ����ݽ��
s_result = S_result(node,line,YtYm);                                              % ������·����
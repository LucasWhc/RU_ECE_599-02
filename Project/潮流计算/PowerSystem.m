function [node_result,s_result] = PowerSystem                              % ��������������  
%% 
[node] = OpenNode; 
[nn,mn] = size(node);                                                      % �������ļ�.������node
%% 
[line] = OpenLine;
[nl,ml] = size(line);                                                      % �������ļ�.������line
%% 
[node,line,nPQ,nPV,nodenum,PH,PV,PQ] = Num(node,line);                     % �Խڵ���������
%% 
Y = sparse(Yij(node,line))                                                % ����ڵ㵼�ɾ���
%%
[U] = Gauss_Seidel(Y,node,nPQ,nPV)
[U1] = abs(U)                                   % ����GS�㷨�Ľ������Ϊ��ֵ
[U2] = angle(U)
%% 
[node_result,s_result] =Newton_Raphson(U1,Y,node,nPQ,nPV,line,nodenum);     % ��ţ������ѷ�����㳱�����
%% 
Result_Write(node_result,s_result,node,line);                              % �ѽ��д���ļ�

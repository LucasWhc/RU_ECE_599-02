function [node_result,s_result] = PowerSystem                              % Main function for power analysis
%% 
[node] = OpenNode; 
[nn,mn] = size(node);                                                      % open bus info
%% 
[line] = OpenLine;
[nl,ml] = size(line);                                                      % open line info
%% 
[node,line,nPQ,nPV,nodenum,PH,PV,PQ] = Num(node,line);                     % reorganizing buses
%% 
Y = sparse(Yij(node,line))                                                % calculating Y admittance matrix
%%
[U] = Gauss_Seidel(Y,node,nPQ,nPV)
[U1] = abs(U)                                   % returning GS result as initial guess for NR method
[U2] = angle(U)
%% 
[node_result,s_result] =Newton_Raphson(U1,Y,node,nPQ,nPV,line,nodenum);     % calcuting by NR method
%% 
Result_Write(node_result,s_result,node,line);                              % writing result to file

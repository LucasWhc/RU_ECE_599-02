function [node_result,s_result] =Newton_Raphson(U,Y,node,nPQ,nPV,line,nodenum)    % NR function
[nn,mn] = size(node);
%% 
EPS = 1.0e-10;                                                                    % setting epsilon
%% 
for t = 1:1000                                                                    % setting the largest iteration number
%% 
[dP,dQ] = DPQ(Y,node,nPQ,nPV);                                                    % calculating the bias between P and Q
%% 
% Jac = Jac_NR(node,Y,nPQ); 
Jac = sparse(Jac_NR(node,Y,nPQ));                                                  % calculating Jacobian matrix
%% 
UD = zeros(nPQ,nPQ); 
for i = 1:nPQ
    UD(i,i) = U(i,1);                                                             % generating voltage matrix
end
%% 
dAngU = Jac \ [dP;dQ];                                                            
dAng = dAngU(1:nn-1,1);                                                           % calculating phase angle
dU = UD*(dAngU(nn:nn+nPQ-1,1));                                                   % calculating |voltage|
node(1:nPQ,2) = node(1:nPQ,2) - dU;                                               % update |v|
node(1:nn-1,3) = node(1:nn-1,3) - dAng;                                           % upadte angle
%% 
if (max(abs(dU))<EPS)&(max(abs(dAng))<EPS)
   break
end                                                                               % check if satified by the epsilon
end
%% 
node = PQ_NR(node,Y,nPQ,nPV)                                                      % calculating bus injecting complex power
%% 
[node,line] = ReNum(node,line,nodenum);                                           % reorganize the bus number to previous number
%% 
YtYm = YtYm_NR(line);                                                             % calculating Yt and Ym for line power analisis
%% 
node_result = Node_result(node);                                                  % writing g bus power,voltage results
s_result = S_result(node,line,YtYm);                                              % writing line power,voltage results
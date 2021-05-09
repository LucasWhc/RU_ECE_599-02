function node_result = Node_result(node);             % calculating bus result function
%% 
[nn,mn]=size(node);
%% 
node_result = zeros(nn,4);                            % node_result matrix for storing results
node_result(:,1:2) = node(:,1:2);                     % column 1 and 2 for bus number and |v|
node_result(:,3) = node(:,3) *180 / pi;               % transforming the phase angle to degree
node_result(:,4) = node(:,4) + (sqrt(-1))*node(:,5);  % writing injecting power
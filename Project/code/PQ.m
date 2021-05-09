function U1 = PQ(i,U,node,Y,nPQ)                                            % PQ bus volate calculation function
%% 
[nn,mn]=size(node);                                                         % get bus info to calculate
N1=zeros(nPQ,1);
N2=zeros(nn,1);
U1=zeros(nPQ,1);
%% 
N1(i,1)=((node(i,4)-node(i,5)*sqrt(-1))/(conj(U(i,1))))/Y(i,i);             
%% 
for j=1:nn                                                                 
     if j~=i
        N2(i,1)=N2(i,1)+Y(i,j)*U(j,1);
     end
end
           U1(i,1)=(N1(i,1)-N2(i,1)/Y(i,i));                                % get PQ bus result
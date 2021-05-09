function U2 = PV(i,U,node,Y,nPV)                                            % ����PV�ڵ��ѹ���ӳ���
%% 
[nn,mn]=size(node);                                                         % ֻ����i�ľ���ֻ��Ҫ��Ӧ���͵Ľڵ���
N3=zeros(nn,1);
N4=zeros(nPV,1);
N5=zeros(nPV,1);
N6=zeros(nn,1);
U2=zeros(nPV,1);
%% 
for j=1:nn                                                                  % �����޹�
     N3(i,1)=N3(i,1)+conj(Y(i,j))*conj(node(i,2)*cos(node(i,3))+node(i,2)*sin(node(i,3))*sqrt(-1));
end
N4(i,1)=imag(U(i,1)*N3(i,1));
N5(i,1)=((node(i,4)-N4(i,1)*sqrt(-1))/(conj(U(i,1))))/Y(i,i);
%% 
for j=1:nn                                                                  % ���޹��������
    if j~=i
       N6(i,1)=N6(i,1)+Y(i,j)*(node(i,2)*cos(node(i,3))+node(i,2)*sin(node(i,3))*sqrt(-1));
    end
end                                                                         % ����ԭ��ֵ
           U2(i,1)=node(i,2)*cos(angle(N5(i,1)-N6(i,1)))+node(i,2)*sin(angle(N5(i,1)-N6(i,1)))*sqrt(-1);

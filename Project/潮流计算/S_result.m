function s_result = S_result(node,line,YtYm)                  % ���㹦�ʷֲ�����Ҫ�ο�P108��ѹ���ĵ�ֵ��·ͼ
%% 
[nl,ml]=size(line);
s_result = zeros(nl,7);                                       % ������·����������
s_result(:,1:2) = line(:,1:2);                                % ǰ����Ϊ�ڵ�
%% 
for k=1:nl
    I = s_result(k,1);
    J = s_result(k,2);                                        % ����ڵ�
    %%                                     
    if (J~=0)&(I~=0)                                          % ����ǽӵ�֧·�ĳ������ֱ����i��Ĺ��ʺ�j��Ĺ���Ȼ�����
        s_result(k,3)=node(I,2)^2*(conj(YtYm(k,3))+conj(YtYm(k,4)))-node(I,2)*node(J,2)*(cos(node(I,3))+j*sin(node(I,3)))*(conj(cos(node(J,3))+j*sin(node(J,3))))*conj(YtYm(k,3));
        s_result(k,4)=node(J,2)^2*(conj(YtYm(k,3))+conj(YtYm(k,5)))-node(I,2)*node(J,2)*(conj(cos(node(I,3))+j*sin(node(I,3))))*(cos(node(J,3))+j*sin(node(J,3)))*conj(YtYm(k,3));
        s_result(k,5)=s_result(k,3) + s_result(k,4);
        s_result(k,6)=node(I,2)*(cos(node(I,3))+j*sin(node(I,3)))*(YtYm(k,3)+YtYm(k,4))-node(J,2)*(cos(node(J,3))+j*sin(node(J,3)))*YtYm(k,3);
        s_result(k,7)=node(J,2)*(cos(node(J,3))+j*sin(node(J,3)))*(YtYm(k,3)+YtYm(k,5))-node(I,2)*(cos(node(I,3))+j*sin(node(I,3)))*YtYm(k,3);
    elseif J==0                                               % ���ù�ʽ����ӵ�֧·�ĳ�����������i�࣬������j��
        s_result(k,3)=node(I,2)^2*conj(YtYm(k,4));
        s_result(k,5)=s_result(k,3)+s_result(k,4);
        s_result(k,6)=node(I,2)*(cos(node(I,3))+j*sin(node(I,3)))*YtYm(k,4);
    else
        s_result(k,4)=node(J,2)^2*conj(YtYm(k,5));
        s_result(k,5)=s_result(k,3)+s_result(k,4);
        s_result(k,7)=node(J,2)*(cos(node(J,3))+j*sin(node(J,3)))*YtYm(k,5);
    end
end
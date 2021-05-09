function Y = Yij(node,line)
%% 
[nn,mn]=size(node);
[nl,ml]=size(line);
%% 
Y=zeros(nn,nn);                        % �Ե��ɾ��󸳳�ֵ0 
%% 
for k=1:nl    
    I=line(k,1);   
    J=line(k,2);    
    Zt=line(k,3)+j*line(k,4);          % ������·���� 
    if Zt~=0
        Yt=1/Zt;                       % �ӵ�֧·������Yt
    end
    Ym=line(k,5)+j*line(k,6);          % ����G+B
    K=line(k,7);                       % ȡ��ѹ����·���
    
    %% 
    if (K==0)&(J~=0)                   % ��ͨ��·: K=0
        Y(I,I)=Y(I,I)+Yt+Ym;           % YIIΪ�Ե���
        Y(J,J)=Y(J,J)+Yt+Ym;           
        Y(I,J)=Y(I,J)-Yt;              % ������
        Y(J,I)=Y(I,J);    
    end                                %��⵼��
    %% 
    if (K==0)&(J==0)                   % �Ե�֧·: K=0,J=0,R=X=0
        Y(I,I)=Y(I,I)+Ym;              % ֱ�Ӽӵ��Ե�����
    end        
    %% 
    if K>0                             % ��ѹ����·:���㵽i��,K��j�࣬�ο�����P108        
        Y(I,I)=Y(I,I)+Yt+Ym;        
        Y(J,J)=Y(J,J)+Yt/K/K;        
        Y(I,J)=Y(I,J)-Yt/K;        
        Y(J,I)=Y(I,J);    
    end        
    %% 
    if K<0                             % ��ѹ����·:���㵽j��,K��i��        
        Y(I,I)=Y(I,I)+Yt+Ym;        
        Y(J,J)=Y(J,J)+K*K*Yt;        
        Y(I,J)=Y(I,J)+K*Yt;        
        Y(J,I)=Y(I,J);    
    end
%disp(Y);    
end
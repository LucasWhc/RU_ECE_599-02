function Y = Yij(node,line)
%% 
[nn,mn]=size(node);
[nl,ml]=size(line);
%% 
Y=zeros(nn,nn);                        % creating Y matrix
%% 
for k=1:nl    
    I=line(k,1);   
    J=line(k,2);    
    Zt=line(k,3)+j*line(k,4);          % reading line info
    if Zt~=0
        Yt=1/Zt;                       % ground line
    end
    Ym=line(k,5)+j*line(k,6);          % calculating G+B
    K=line(k,7);                       % transformers voltage ratio K
    
    %% 
    if (K==0)&(J~=0)                   % normal line: K=0
        Y(I,I)=Y(I,I)+Yt+Ym;           % YII calculation
        Y(J,J)=Y(J,J)+Yt+Ym;           
        Y(I,J)=Y(I,J)-Yt;              % YIJ calculation
        Y(J,I)=Y(I,J);    
    end                                % get Y
    %% 
    if (K==0)&(J==0)                   % line connected to the ground: K=0,J=0,R=X=0
        Y(I,I)=Y(I,I)+Ym;              % adding to YII
    end        
    %% 
    if K>0                             % transformers line   
        Y(I,I)=Y(I,I)+Yt+Ym;        
        Y(J,J)=Y(J,J)+Yt/K/K;        
        Y(I,J)=Y(I,J)-Yt/K;        
        Y(J,I)=Y(I,J);    
    end        
    %% 
    if K<0                             % transformers line for K<0
        Y(I,I)=Y(I,I)+Yt+Ym;        
        Y(J,J)=Y(J,J)+K*K*Yt;        
        Y(I,J)=Y(I,J)+K*Yt;        
        Y(J,I)=Y(I,J);    
    end
%disp(Y);    
end
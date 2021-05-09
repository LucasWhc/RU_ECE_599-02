function s_result = S_result(node,line,YtYm)                  % calculating complex power fucntion
%% 
[nl,ml]=size(line);
s_result = zeros(nl,7);                                       % storing line power result
s_result(:,1:2) = line(:,1:2);                                % first two column for bus number
%% 
for k=1:nl
    I = s_result(k,1);
    J = s_result(k,2);                                        % storing bus
    %%                                     
    if (J~=0)&(I~=0)                                          % calculating lines not connected to the ground
        s_result(k,3)=node(I,2)^2*(conj(YtYm(k,3))+conj(YtYm(k,4)))-node(I,2)*node(J,2)*(cos(node(I,3))+j*sin(node(I,3)))*(conj(cos(node(J,3))+j*sin(node(J,3))))*conj(YtYm(k,3));
        s_result(k,4)=node(J,2)^2*(conj(YtYm(k,3))+conj(YtYm(k,5)))-node(I,2)*node(J,2)*(conj(cos(node(I,3))+j*sin(node(I,3))))*(cos(node(J,3))+j*sin(node(J,3)))*conj(YtYm(k,3));
        s_result(k,5)=s_result(k,3) + s_result(k,4);
        s_result(k,6)=node(I,2)*(cos(node(I,3))+j*sin(node(I,3)))*(YtYm(k,3)+YtYm(k,4))-node(J,2)*(cos(node(J,3))+j*sin(node(J,3)))*YtYm(k,3);
        s_result(k,7)=node(J,2)*(cos(node(J,3))+j*sin(node(J,3)))*(YtYm(k,3)+YtYm(k,5))-node(I,2)*(cos(node(I,3))+j*sin(node(I,3)))*YtYm(k,3);
    elseif J==0                                               % calculating lines connected to the ground
        s_result(k,3)=node(I,2)^2*conj(YtYm(k,4));
        s_result(k,5)=s_result(k,3)+s_result(k,4);
        s_result(k,6)=node(I,2)*(cos(node(I,3))+j*sin(node(I,3)))*YtYm(k,4);
    else
        s_result(k,4)=node(J,2)^2*conj(YtYm(k,5));
        s_result(k,5)=s_result(k,3)+s_result(k,4);
        s_result(k,7)=node(J,2)*(cos(node(J,3))+j*sin(node(J,3)))*YtYm(k,5);
    end
end
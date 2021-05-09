function [] = Result_Write(node_result,s_result,node,line)
[nn,mn] = size(node);
[nl,ml] = size(line);
% ace = fopen('Result.TXT','a');                                             % writing result in Result.txt
ace = fopen('Result1.TXT','a');
%% 
fprintf(ace,'Results of nodes£º\nNode    Node Voltage   Angle£¨degree£©          Node power\n');
for i = 1:nn
    fprintf(ace,'%2.0f      ', node_result(i,1));
    fprintf(ace,'%10.6f      ',node_result(i,2));
    fprintf(ace,'%10.6f      ',node_result(i,3));
    fprintf(ace,'%10.6f + j %10.6f\n',real(node_result(i,4)),imag(node_result(i,4)));
end
%% 
fprintf(ace,'\nResults of lines£º\nNode I  Node J        Line power S(I,J)            Line power S(J,I)            Line losses dS(I,J)             Current I(I,J)               CurrentI(J,I)\n');
for i = 1:nl
    fprintf(ace,'%2.0f      ',s_result(i,1));
    fprintf(ace,'%2.0f      ',s_result(i,2));
    fprintf(ace,'%10.6f + j %10.6f     ',real(s_result(i,3)),imag(s_result(i,3)));
    fprintf(ace,'%10.6f + j %10.6f     ',real(s_result(i,4)),imag(s_result(i,4)));
    fprintf(ace,'%10.6f + j %10.6f     ',real(s_result(i,5)),imag(s_result(i,5)));
    fprintf(ace,'%10.6f + j %10.6f     ',real(s_result(i,6)),imag(s_result(i,6)));
    fprintf(ace,'%10.6f + j %10.6f\n\n',real(s_result(i,7)),imag(s_result(i,7)));
end
fclose(ace);


function [node] = OpenNode
[dfile,pathname]=uigetfile('*.m','Select Node File');   % �����ļ�����Ϊm�ļ������ڱ���Ϊ��Select Node File��
if pathname == 0  
    error(' you must select a valid data file')         % ���û��ѡ����Ч�ļ�������ִ�����ʾ
else  
    lfile =length(dfile);                               % ȥ���ļ���׺  
    eval(dfile(1:lfile-2));                             % ���ļ�
end
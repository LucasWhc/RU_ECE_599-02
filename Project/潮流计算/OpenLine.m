function [line] = OpenLine
[dfile,pathname]=uigetfile('*.m','Select Line File');   % �����ļ�����Ϊm�ļ������ڱ���Ϊ��Select Line File��
if pathname == 0  
    error(' you must select a valid data file')         % ���û��ѡ����Ч�ļ�������ִ�����ʾ
else  
    lfile =length(dfile);                               % ȥ���ļ���׺  
    eval(dfile(1:lfile-2));                             % ���ļ�
end
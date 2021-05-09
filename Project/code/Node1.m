% column 1 for bus number，column 2 for |v|，column 3 for phase angle
% column 4 for P，column 5 for Q，column 6 for bus type
% 1 is PQ，2 is PV，3 is slack bus

node = ...
  [1 1.03 0 7 0 2;
   2 1.01 0 7 0 2;
   3 1.03 0 0 0 3;
   4 1.01 0 7 0 2;
   5 1 0 0 0 1;
   6 1 0 -9.67 -1 1;
   7 1 0 0 0 1;
   8 1 0 -17.67 -1 1;
   9 1 0 0 0 1;
   10 1 0 0 0 1];
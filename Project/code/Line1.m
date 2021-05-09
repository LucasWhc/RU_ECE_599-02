% column 1 to 2 represent bus number，column 3 for resistance，column 4 for inductance
% column 5,6 for G and B in half line charging admittance, column 7 for
% transformers' rated volatege ratio

line = ...
  [1 5 0 0.016666666666666666 0 0 1;
   2 5 0 0.016666666666666666 0 0 1;
   5 6 0.001 0.01 0 0.00875 0;
   6 7 0.011 0.11 0 0.09625 0;
   7 8 0.011 0.11 0 0.09625 0;
   7 8 0.011 0.11 0 0.09625 0;
   8 9 0.001 0.01 0 0.00875 0;
   8 9 0.001 0.01 0 0.00875 0;
   4 9 0 0.016666666666666666 0 0 1;
   9 10 0.0025 0.025 0 0.021875 0;
   3 10 0 0.016666666666666666 0 0 1;
   6 0 0 0 0 2.1 0;
   8 0 0 0 0 3.6 0];
/*
module half_subtractor(input a, b, output D, B);
  assign D = a ^ b;
  assign B = ~a & b;
endmodule
*/

module half_subtractor(input a, b, output D, B);
  wire w1;
  xor(D,a,b);
  not(w1,a);
  and(w1,b);
endmodule


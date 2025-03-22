module half_adder(input a, b, output s, Cout);
  assign S = a ^ b;
  assign Cout = a & b;
endmodule

/*
//data flow
module half_adder(input a, b, output s, Cout);
  xor (s,a,b);
  and(cout,a,b);
endmodule
*/

/*//behaviour level
module half_adder(input a, b, output s, Cout);
  always@(*) begin
    S = a ^ b;
    Cout = a & b;
    //{cou,s}=a+b;
  end
endmodule
*/

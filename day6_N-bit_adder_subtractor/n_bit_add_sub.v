//https://www.edaplayground.com/x/RAyq
module full_adder(
  input a,
  input b,
  input cin,
  output sum,
  output cout
);
  wire w1,w2,w3;
  xor(w1,a,b);
  xor(sum,w1,cin);
  and(w2,a,b);
  and (w3,w1,cin);
  or(cout,w2,w3);
endmodule

//`include "fulladder.v"
module ripple_carry_adder #(parameter N = 4) (
  input [N-1:0] A, 
  input [N-1:0] B, 
  input Cin, 
  output [N-1:0] Sum, 
  output Cout
);

  wire [N:0] carry;
  wire[N-1:0]w1;
  assign carry[0] = Cin;
  
  genvar i;
  generate
    for (i = 0; i < N; i = i + 1) begin : full_adder_stage
      xor Xor(w1[i],B[i],Cin);
      full_adder FA (
        .a(A[i]), 
        .b(w1[i]), 
        .cin(carry[i]), 
        .sum(Sum[i]), 
        .cout(carry[i+1])
      );
        end
    endgenerate
    
    assign Cout = carry[N];
endmodule

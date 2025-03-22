module full_adder(
  input a,
  input b,
  input cin,
  output sum,
  output cout
);
  wire w1,w2,w3;
  assign w1 =a^b;
  assign sum =w1^cin;
  assign w2 =a&b;
  assign w3 =w1&cin;
  assign c = w3|w2;
endmodule

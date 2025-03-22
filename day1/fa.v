/*// data flow leve
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
  assign cout = w3|w2;
endmodule
*/
/*
//gate level
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
*/
/*
//behaviour level
module full_adder(
  input a,
  input b,
  input cin,
  output sum,
  output cout
);

  always@(*) begin
    sum =a^b^cin;
    cout =(a&b)|(b^a)cin);
    //{cout,sum}=a+b+cin;
  end
endmodule
*/












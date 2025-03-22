/*
//data flow
module full_subtractor(input a, b, Bin, output D, Bout);
  assign D = a ^ b ^ Bin;
  assign Bout = (~a & b) | (~(a ^ b) & Bin);
endmodule
*/
/*
//gate level
module full_subtractor(input a, b, Bin, output D, Bout);
  wire w1,w2,w3,w4,w5,w6;
  xor(w1,a,b);
  xor(D,w1,Bin);
  not(w3,a);
  and(w4,w3,b);
  not(w5,w1);
  and(w6,w5,w4);
  or(Bout,w4,w6)
endmodule
*/

//using nand
module full_subtractor(
    input a, b, Bin,
    output D, Bout
);
    wire n1, n2, n3, n4, n5, n6, n7;

    // XOR using NaND for Difference (a ⊕ b)
    nand nand1(n1, a, b);
    nand nand2(n2, a, n1);
    nand nand3(n3, b, n1);
    nand nand4(n4, n2, n3); // a ⊕ b
 
    //   Bin for final Difference
    nand nand5 (n5, n4, Bin);
    nand nand6 (n6, n4, n5);
    nand nand7 (n7, Bin, n5);
    nand nand8 (D, n6, n7);  // D = a ⊕ b ⊕ Bin

    // Borrow Logic (Bout = a'b + b'Bin + a'Bin)
    nand nand9 (Bout, n1,n5);  
endmodule

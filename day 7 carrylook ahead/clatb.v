module testbench;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

  cla uut (
    .a(A), .b(B), .cin(Cin), .sum(Sum), .cout(Cout)
    );

    initial begin
        $monitor("A = %b, B = %b, Cin = %b -> Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);
        
        A = 4'b0001; B = 4'b0011; Cin = 0; #10;  // 1 + 3 = 4
        A = 4'b0101; B = 4'b0011; Cin = 1; #10;  // 5 + 3 + 1 = 9
        A = 4'b1111; B = 4'b0001; Cin = 0; #10;  // 15 + 1 = 16 (Overflow)
        A = 4'b0110; B = 4'b1001; Cin = 1; #10;  // 6 + 9 + 1 = 16 (Overflow)

        $finish;
    end
endmodule

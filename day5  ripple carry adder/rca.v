//`include"fulladder.v"
//https://www.edaplayground.com/x/WjC9
module ripple_carry_adder #(parameter N = 4) (
    input [N-1:0] A, 
    input [N-1:0] B, 
    input Cin, 
    output [N-1:0] Sum, 
    output Cout
);
    wire [N:0] carry;
    assign carry[0] = Cin;
    
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : full_adder_stage
            full_adder FA (
                .a(A[i]), 
                .b(B[i]), 
                .cin(carry[i]), 
                .sum(Sum[i]), 
                .cout(carry[i+1])
            );
        end
    endgenerate
    
    assign Cout = carry[N];
endmodule

/*module full_adder (
    input a, 
    input b, 
    input cin, 
    output sum, 
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
*/

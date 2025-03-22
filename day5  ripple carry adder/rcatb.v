//https://www.edaplayground.com/x/WjC9
module testbench;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;
  int i=0;

    ripple_carry_adder #(4) rca (
        .A(A), 
        .B(B), 
        .Cin(Cin), 
        .Sum(Sum), 
        .Cout(Cout)
    );

    initial begin
      
      for(i=0;i<512;i=i+1) begin
        {Cin,B,A}=i;
        $display(" Cin = %d, B = %d, A = %0d,Sum = %d, Cout = %d, result= %d ",Cin, B,A, Sum, Cout,{Cout,Sum}); 
        #5;    
      end
      $finish;
    end
endmodule

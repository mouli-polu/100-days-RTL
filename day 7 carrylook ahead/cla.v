// https://www.edaplayground.com/x/wsp4
module cla #(parameter N=4)(
  input [N-1:0]  a,
  input [N-1:0]  b,
  input 		 cin,
  output [N-1:0] sum,
  output  cout
);
  wire [N-1:0]g;
  wire [N-1:0]p;
  wire [N:0]c;
  
  genvar i;
  generate 
    for( i =0;i<N;i=i+1) begin :XOR
      and(g[i],a[i],b[i]);
      xor(p[i],a[i],b[i]);
    end
  endgenerate
    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
    assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);
  genvar j;
  generate 
    for (j=0;j<N;j=j+1) begin :XoR
      xor(sum[j],p[j],c[j]);
    end
  endgenerate
endmodule
  
  
  

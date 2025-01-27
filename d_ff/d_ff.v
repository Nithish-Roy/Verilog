module d_ff_asyn(d,clk,rst,q);
input d,clk,rst;
output reg q;
always@(posedge clk or negedge rst)
begin
if (!rst) 
  q <= 1'b0;
  else 
  q <= d;
end
endmodule

module d_ff_syn(d,clk,rst,q);
input d,clk,rst;
output reg q;
always@(posedge clk)
begin
if (!rst) 
  q <= 1'b0;
  else 
  q <= d;
end
endmodule

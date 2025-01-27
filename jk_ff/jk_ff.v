module jk_ff_asyn (jk,clk,rst,q);
 input [1:0] jk;
 input clk ,rst;
 output reg q;
always @(posedge clk or negedge rst)
begin 
if(!rst)begin 
	q <= 1'b0;
end	
else begin
case(jk)
2'b00: q <= q;
2'b01: q <= 1'b0;
2'b10: q <= 1'b1;
2'b11: q <= ~q;
endcase
end
end
endmodule

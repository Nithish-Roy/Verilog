module sr_ff(input [1:0] sr, input clk,rst, output reg q);
always@(posedge clk ,negedge rst)
begin 
if (!rst)
q <=0;
else begin 
case (sr) 
2'b00: q <= q;
2'b01: q <= 0;
2'b10: q <= 1;
2'b11: q <= 1'bx;
endcase
end
end
endmodule

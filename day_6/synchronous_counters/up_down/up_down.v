module up_down_counter #(parameter NBIT = 5 )(input clk, rst, up_down, output reg [NBIT-1:0] q);
always @(posedge clk)
begin
if(rst)
q <= 4'b0000;
else if(up_down)
q <= q+1;
else 
q = q-1;
end
endmodule

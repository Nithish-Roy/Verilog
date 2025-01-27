module lfsr( input clk,
	           reset,
        output reg [3:0] q);
always@(posedge clk) begin
if (!reset) 
q <= 4'b1111;
else
q <= {q[2:0],q[3]^q[2]};
end
endmodule

//Write RTL code to design a 3-bit SISO right shift register using only a Non-blocking assignment. (Do not use any operators).
module bit_3_siso( input clk,
       		         input clr,
		               input data_in,
		               output reg [2:0] q);
always @(posedge clk or negedge clr)
begin
	if (!clr)
		q <= 3'b000;
	else 
		q <= {data_in,q[2:1]};
end
endmodule

module nbitpipo #(parameter NBIT = 5)( input clk,
       		 input clr,
		 input [NBIT -1:0] data_in,
		 output reg [NBIT -1 :0] q);
	 
always @(posedge clk or negedge clr)
begin
	if (!clr)
		q = 0;
	else 
		q <= data_in;
end
endmodule

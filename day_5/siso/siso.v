module nbitsiso #(parameter NBIT = 5)( input clk,
       		                             input clr,
		 input data_in,
		 output reg [NBIT -1 :0] q,
	 	 output reg q_out);
	 
always @(posedge clk or negedge clr)
begin
	if (!clr)
		q = 0;
	else 
	q <= {data_in,q[NBIT -1 :1]};
	q_out <= q[0];
end
endmodule

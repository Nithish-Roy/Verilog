module sipo #(parameter NBIT = 4) (input clk,
	    input clr,
    	    input data_in,
    	    output reg [NBIT -1 :0] q);
    always @(posedge clk)
    begin
	    if (clr)
		    q <= 0;
	    else 
		    q <= {data_in,q[NBIT -1:1]};
	    end

    endmodule

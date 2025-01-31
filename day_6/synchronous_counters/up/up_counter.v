module up_count_syn #(parameter QBIT = 10)(input clk,
		                                        input rst,
	    	                                  output reg [QBIT-1:0] q);
	    always@(posedge clk)begin
		    if(rst)
			    q <= 0;
		    else
			    q = q + 1'b1;
	    end
	    endmodule

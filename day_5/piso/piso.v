module piso(clk,clr, parallel_in, load, serial_out);
    input clk, load, clr;
    input [3:0] parallel_in;
    output reg serial_out;

    reg [3:0] tmp;

    always @(posedge clk) begin
	    if (clr)begin 
             tmp = 4'b0000;
     end
    	else if(load)
		          tmp <= parallel_in;
        else begin
            serial_out <= tmp[0];
            tmp <= { 1'b0,tmp[2:1]};
        end
    end
endmodule

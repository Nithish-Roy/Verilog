`timescale 1ns / 1ps
module clk_gen(clk);
reg clk = 0;
always #5 clk = ~clk;
initial begin 
	$dumpfile("clk.vcd");
	$dumpvars;
end
endmodule

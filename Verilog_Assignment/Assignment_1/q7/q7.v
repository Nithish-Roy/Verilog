//Write Verilog code for generating an infinite clock signal with a 50%
//Duty cycle having a time period of 10ns using a forever loop.
`timescale 1ns / 1ps
module clk_gen(clk);
reg clk = 0;
always #5 clk = ~clk;
initial begin 
	$dumpfile("clk.vcd");
	$dumpvars;
end
endmodule

module up_count_syn_tb #(parameter QBIT = 5);
reg clk;		    
reg rst;
wire [QBIT-1:0] q;

up_count_syn inst1 (clk , rst, q);

initial begin 
rst = 0;
clk = 0;
end

initial begin
#5;
rst = 1;
forever #5 clk = ~clk;
end

initial begin 
   #15;	rst = 0;
end

initial begin 
	$dumpfile("dump.vcd");
	$dumpvars;
	#100;
	$finish;
end

endmodule

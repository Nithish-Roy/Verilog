module piso_tb();
reg clk;
reg clr;
reg load;
reg [3:0] parallel_in;
wire serial_out;

piso inst1( clk, clr, parallel_in, load, serial_out );

initial begin
#5;
clr = 1;
clk = 0;
load = 0;
forever #5 clk = ~clk;
end

initial begin 
$monitor($time, "parallel_in = %b load = %b serial_out = %b clr = %b",parallel_in , load, serial_out, clr);
$dumpfile("piso_tb.vcd");
$dumpvars();
end

initial begin	
#15;
clr = 0;
/*#15;
load =1;
parallel_in = $random % 16;
#5;
load = 0;*/
#50;
$finish;
end

endmodule


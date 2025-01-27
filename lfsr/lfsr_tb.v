module lfsr_tb;
reg clk;
reg reset;
wire [3:0] q;
lfsr isnt1(clk , reset , q);

initial begin 
clk = 0; reset = 0;
forever #5 clk = ~clk;
end

initial begin 
$dumpfile("lfsr_tb.vcd");
$dumpvars();
$monitor("%0t rst = %b q = %b",$time,reset,q);

#100; $finish();
end

initial begin
#10 reset = 1'b1;
end
endmodule

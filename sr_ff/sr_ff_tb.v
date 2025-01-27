module sr_ff_tb;
reg [1:0] sr;
reg rst,clk;
wire q;
sr_ff inst1(.sr(sr),.rst(rst),.clk(clk),.q(q));
initial begin 
clk = 1'b0;
forever #5 clk = ~clk;
end
initial begin 
repeat(10)begin 
sr = $random %4; rst = $random %2;
#5;
end
$finish;
end
initial begin
$dumpfile("sr_ff_tb.vcd");
$dumpvars;
$monitor("%0t clk=%b sr = %b rst=%b q = %b",$time,clk,sr,rst,q);
end
endmodule

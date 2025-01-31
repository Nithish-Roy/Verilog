module up_down_tb;
reg clk;
reg rst;
reg up_down;
wire [3 :0] q;

up_down_counter inst1 (clk, rst, up_down, q);

initial begin 
clk = 0;
#5
forever #5 clk = ~clk;
end

initial begin 
#7;
rst = 1;
#5;
rst = 0;
up_down  = 1;
end

initial begin 
$monitor($time,"q = %b",q);
$dumpfile("up_down_tb.vcd");
$dumpvars;
end

initial begin
#30;
up_down = 0;
#100;
$finish;
end

endmodule

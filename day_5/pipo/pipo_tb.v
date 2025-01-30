module pipo_tb;
parameter NBIT = 6;
reg clk;
reg clr;
reg [NBIT -1:0]data_in;
wire [NBIT -1 :0] q;

nbitpipo #(NBIT) inst1(clk, clr, data_in, q);

initial
forever #5 clk = ~ clk;

initial begin 
clr = 0;
clk = 0;
end

initial begin
$dumpfile("pipo_tb.vcd");
$dumpvars;
end

initial begin
#5; 
repeat(10)begin
clr = 1;
data_in = $random;
#5;
end
#100;
$finish;
end
endmodule

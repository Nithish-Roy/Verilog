module jk_ff_tb;
reg [1:0] jk;
reg clk,rst;
wire q1,q2;
 jk_ff_asyn inst1(.jk(jk),.clk(clk),.rst(rst),.q(q1));
// jk_ff_syn inst2(.jk1(jk),.clk1(clk),.rst1(rst),.q2(q2));

always #5 clk = ~clk;

initial begin 
$monitor("%0t jk = %b clk = %b rst=%b q1(asyn) =%b",$time,jk,clk,rst,q1);
$dumpfile("jk_ff_tb.vcd");
$dumpvars;
end


initial begin 
rst = 1'b0; clk = 1'b0;
#5;
rst = 1'b1;
tester(2'b00);
tester(2'b10);
tester(2'b01);
tester(2'b11);
$stop;
end

task tester(input [1:0] inputs);
begin
jk = inputs;
#10;
end
endtask
endmodule

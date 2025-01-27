module d_ff_tb();
reg rst1,clk1,d1;
wire q1, q2;
d_ff_asyn inst_1(.d(d1),.clk(clk1),.rst(rst1),.q(q1));
d_ff_syn inst_2(.d(d1),.clk(clk1),.rst(rst1),.q(q2));
initial begin
rst1 =0 ; clk1 = 0;
forever #5 clk1 = ~clk1;
end
//initial begin 
//rst2 =0 ; clk2 = 0;
//forever #5 clk2 = ~clk2;
//end
initial begin 

$display("--------------------Synchronus D_FF--------------------|--------------------Asynchronus D_FF--------------------");
$monitor("%0t d2 = %b q2 = %b clk2 = %b rst2 = %b | %0t d1 = %b q1 = %b clk1 = %b rst1 = %b",$time,d1,q1,clk1,rst1,$time,d1,q1,clk1,rst1);
$dumpfile("d_ff_tb.vcd");
$dumpvars();
repeat(15)begin
#5;
d1 = $random % 2;  rst1 = $random % 2;
end
$monitoroff;
$stop;
end
endmodule

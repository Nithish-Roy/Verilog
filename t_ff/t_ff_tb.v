module t_ff_tb();
reg t,rst,clk;
wire q;
t_ff inst1(.t(t),.rst(rst),.clk(clk),.q(q));
initial begin 
$dumpfile("t_ff_tb.vcd");
$dumpvars;
$monitor(" %0t t=%b q=%b clk =%b rst = %b",$time,t,q,clk,rst);
end
initial begin 
clk=0;
forever #5 clk = ~clk;
end
initial begin 
t =0; rst =0;
repeat(10)begin 
rst = $random %2; t = $random %2;
#5;
end
$stop;
end
endmodule


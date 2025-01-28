module d_latch_tb;
reg en_d;
reg rst_d;
reg d;
wire q_d;


d_latch inst1(.en_d(en),.rst_d(rst),.d(d),.q_d(q_d));


initial begin 
$dumpfile("d_latch_tb.vcd");
$dumpvars();
$monitor("%0t en=%b rst =%b d=%b q =%b ",$time,en,rst,d,q_d);
#100;
$finish;
end

initial begin
repeat (20)begin
d = $random %2; en_d = $random %2; rst_d = $random %2;
#10;
end
end

endmodule

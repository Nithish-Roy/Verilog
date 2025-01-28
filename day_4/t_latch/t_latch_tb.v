module d_latch_tb;
reg en_t;
reg rst_t;
reg t;
wire q_t;

t_latch inst2(.en_t(en),.rst_t(rst),.t(t),.q_t(q_t));

initial begin 
  $dumpfile("t_latch_tb.vcd");
$dumpvars();
  $monitor("%0t en=%b rst =%b t = %b q_t = %b",$time,en_t,rst_t,t,q_t);
#100;
$finish;
end

initial begin
repeat (20)begin
t = $random %2; en_t = $random %2; rst_t = $random %2;
#10;
end
end

endmodule

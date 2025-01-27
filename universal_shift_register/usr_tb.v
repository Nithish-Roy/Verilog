module usr_tb;
reg [3:0] data_in;
reg [1:0] sel;
reg shift_left_data;
reg shift_right_data;
reg clk;
reg reset;
wire  [3:0] parallel_data;
wire  shift_left_out;
wire  shift_right_out;
usr inst1(data_in,sel,shift_left_data,shift_right_data,clk,reset,parallel_data,shift_left_out,shift_right_out); 
always #5 clk = ~clk; //clock of period 5

initial begin 
$dumpfile("usr_tb_vcd");
$dumpvars;
$monitor(" %0t clk = %b data_in = %b sel = %b shift_left_data = %b shift_right_data = %b reset = %b parallel_data = %b serial_left_out = %b serial_right_out = %b",$time,clk,data_in,sel,shift_left_data,shift_right_data,reset,parallel_data,shift_left_out,shift_right_out);
end

initial begin 
reset = 1'b0; clk = 1'b0;
end

task data_feed(input[3:0] datas);
begin
for (datas=0; datas<16; datas=datas+1) begin:data_feed
data_in = datas;
#10;
end
end
endtask

task select_functions(input [1:0] selc);
begin
for(selc =0; selc<4; selc = selc+1)begin :selc_func
sel = selc;
#10;
end
end 
endtask

task shift_datas(input start);
begin
wait(start)
repeat(10)begin 
shift_left_data = $random % 2; shift_right_data = $random %2;
#10;
end

end
endtask

initial fork 
#5 reset = 1'b1;
#10 data_feed(4'b0000);
#10 select_functions(2'b00);
#10 shift_datas(1'b1);
join

initial begin 
#100;
$finish;
end
endmodule

module fsm_tester();
	reg	clk;
	reg	rst;
	reg	up_1,up_2;
	reg	down_1,down_2;
	wire 	[1:0] count_up;
	wire 	[1:0] count_down;

	fsm_counter inst1(.clk(clk), .rst(rst), .up(up_1), .down(down_1), .count(count_up));
	fsm_counter inst2( .clk(clk), .rst(rst), .up(up_2), .down(down_2), .count(count_down));

	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars;
		$monitor($time, "count_up = %b count_down =%b",count_up, count_down);
	end

	initial begin 
		clk = 0;
		rst = 1;
		forever #5 clk = ~clk;
	end

	initial begin 
		#15 rst = 0;
		#5 rst = 1;
		up_1 = 1;
		up_2 = 0;
		down_1 = 0;
		down_2 = 1;
	end
	
	initial begin 
		#200;
		$finish;
	end
endmodule



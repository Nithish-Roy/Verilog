module asyn_counter_tb;
	reg clk;
	reg rst;
	wire [3:0]q1,q2;
	asyn_up_counter inst1(clk, rst, q1);
	asyn_down_counter inst2(clk, rst, q2);
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
		$monitor($time,"qup = %d qdown = %d ",q1,q2);
	end

	initial begin 
		clk = 0; rst = 1;
		forever #5 clk = ~clk;
	end
  
	initial begin
		#5;
		rst = 0;
		#10;
		rst = 1;
	end
		initial begin 
			#160;
			$finish;
		end

endmodule
		

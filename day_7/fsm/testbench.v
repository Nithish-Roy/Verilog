module test #(parameter NBIT = 5);
	reg clk;
	reg rst;
	reg up_down;
	wire [NBIT -1 :0] q;

	fsm_counter inst1(clk, rst, up_down, q);

	initial begin 
		$dumpfile("dump.vcd");
		$dumpvars;
		$monitor($time,"q = %d" ,q);
	end
		initial begin 
			clk = 0;
			rst = 1;
			forever #5 clk = ~clk;
		end

		initial begin 
			#5
			rst = 0;
			#5
			rst = 1;
			up_down = 1;
			#35
			up_down = 0;
		end

		initial begin 
			#200;
			$finish;
		end

endmodule

// Code your testbench here
// or browse Examples
module seqdc();
	reg clk;
	reg rst;
	reg q_in;
	wire q;
	
	sd inst1(clk , rst , q_in , q);

	initial begin 
		$dumpfile("dump.vcd");
		$dumpvars;
		$monitor(" q_in = %b q = %b",q_in , q);
	end

		initial begin
			rst = 1;	
			clk = 0;
			forever #5 clk = ~clk;
		end
	initial begin
      @(posedge clk) q_in <= 1;
		#5 rst = 0;
		#10 rst = 1;
      @(posedge clk) q_in <= 1;
      @(posedge clk) q_in <= 0;
      @(posedge clk) q_in <= 1;
      @(posedge clk) q_in <= 1; 
      @(posedge clk) q_in <= 0;
      @(posedge clk) q_in <= 0;
      @(posedge clk) q_in <= 1;
      @(posedge clk) q_in <= 1;
      @(posedge clk) q_in <= 0;
      @(posedge clk) q_in <= 1;
      @(posedge clk) q_in <= 0; 
      @(posedge clk) q_in <= 1;
      @(posedge clk) q_in <= 0;
      @(posedge clk) q_in <= 0; 

	end
		initial begin 
			#200;
			$finish;
		end
endmodule	

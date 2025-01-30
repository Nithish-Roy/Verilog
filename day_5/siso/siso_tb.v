module siso_tb # (parameter NBIT = 5) ();
reg clk;
       		reg clr;
		reg  data_in;
		wire [NBIT -1 :0] q;
		wire q_out;
	nbitsiso inst1(clk , clr, data_in, q, q_out);
	initial begin 
		$dumpfile("siso_test.vcd");
		$dumpvars();
	end
	
	always #5 clk = ~clk;
	initial begin
		clk =0;
		clr = 0;
		#5
		clr = 1;
		data_in =1 ;
		#10
		data_in = 1;
		#10
		data_in = 0;
		#10
		data_in = 1;
		#10;
		data_in = 0;
		#100;
		$finish;
	end
	initial
	$monitor($time," data_in = %b q =%b ", data_in , q, q_out);
endmodule

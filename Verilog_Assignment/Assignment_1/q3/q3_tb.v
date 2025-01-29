module siso();
    reg clk;
    reg clr;
		reg  data_in;
		wire [2:0] q;
	bit_3_siso inst1(clk , clr, data_in, q);
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
		data_in = 0;
		#5
		data_in = 1;
		#100;
		$finish;
	end
	initial
	$monitor($time," clr = %b data_in = %b q =%b ",clr , data_in , q);
endmodule

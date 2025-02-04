//write using port a and reading using port b
module dpram_tb#(parameter DATA_WIDTH = 8, ADDRESS_WIDTH = 4, DEPTH = 16);
	reg clk;
	reg we_a;
	reg we_b;
	reg [DATA_WIDTH - 1:0] data_in_a;
	reg[ADDRESS_WIDTH -1 :0] addr_a;
	wire [DATA_WIDTH -1 :0] data_out_a;
	reg [DATA_WIDTH - 1:0] data_in_b;
	reg[ADDRESS_WIDTH -1 :0] addr_b;    	
	wire [DATA_WIDTH -1 :0] data_out_b; 
	integer i,j;
	dpram inst1(clk,we_a, we_b, data_in_a,data_in_b,addr_a,addr_b, data_out_a,data_out_b);
	



	initial begin 
		$dumpfile("dump.vcd");
		$dumpvars;
					end
		initial begin
		clk = 0;
		forever #5 clk = ~clk;
		end
		
			initial begin	
			for(i = 0; i < DEPTH; i = i + 1)begin
			addr_a = i ;
			data_in_a = $random;
			we_a = 1;
			#15;
			we_b= 0;
			addr_b = i;
			#10;
	$display($time,"A addr = %d we = %b data_in = %d data_out = %d B addr = %d we = %b data_in = %d data_out = %d",addr_a,we_a,data_in_a,data_out_a,addr_b,we_b,data_in_b,data_out_b);


			end
			i = 0;
			addr_a = 4'bz;
			data_in_a = 8'bz;
			end

			initial begin 
			#400;
			$finish;
			end
endmodule

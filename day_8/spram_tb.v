module sram_tb#(parameter DATA_WIDTH = 8, ADDRESS_WIDTH = 4, DEPTH = 16);
	reg clk;
	reg we;
	reg [DATA_WIDTH - 1:0] data_in;
	reg[ADDRESS_WIDTH -1 :0] addr;
	wire [DATA_WIDTH -1 :0] data_out;
		integer i,j;
		sram inst1(clk,we, data_in, addr, data_out);
		initial
		$monitor($time, "addr = %d we = %b data_in = %d data_out = %d",addr,we,data_in,data_out);

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
			addr = i ;
			data_in = $random;
			we = 1;
			#10;
      end
      i = 0;
			end

			initial begin
			#165;
			for(j = 0; j < DEPTH; j = j + 1)begin
			addr = j;
			we = 0;
			#10;
			end
			j = 0;
			end

			initial begin 
			#400;
			$finish;
			end
endmodule

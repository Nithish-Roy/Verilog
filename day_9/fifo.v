module fifo  #(parameter DEPTH = 4, parameter SIZE = 8)(
		input			 clk,
		input 			 rst,
		input 			 [SIZE -1 :0] data_in,
		input 			 we,
		input 			 rd,
		output 		         full,
		output			 [$clog2(DEPTH)-1:0] wr,rr,
		//output reg 		 minimal_data,
		output 			 empty,
		output reg 		 [SIZE -1 :0]  data_out);

  reg [$clog2(DEPTH)-1:0] rd_ptr,wr_ptr;
reg [SIZE -1:0] fifo [DEPTH];
reg wrap;

always @(posedge clk)begin
	if(!rst)begin
	data_out = 0;
	//	full = 0;
	//	empty = 0;
		rd_ptr = 0;
		wr_ptr = 0;
	end
end

always @(posedge clk)begin
	if(we && !full) begin
		fifo[wr_ptr] <= data_in;
		wr_ptr <= wr_ptr + 1;
	end
end

always @(posedge clk)begin
	if (rd && !empty)begin
		data_out <= fifo[rd_ptr];
		rd_ptr <= rd_ptr + 1;
	end
end

assign full = ((wr_ptr + 1'b1) == rd_ptr);
assign empty = (wr_ptr  == rd_ptr);
assign wr = wr_ptr;
assign rr = rd_ptr;
endmodule

module demux1to2(input data_in, input sel, output [1:0] data_out);
assign data_out = sel?{1'b0,data_in}:{data_in,1'b0};
endmodule
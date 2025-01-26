module demux1to4(input data_in, input [1:0] sel, output reg [3:0] data_out);
always @(*)begin 
case (sel)
2'd3  : data_out = {data_in,1'b0,1'b0,1'b0};
2'd2  : data_out = {1'b0,data_in,1'b0,1'b0};
2'd1  : data_out = {1'b0,1'b0,data_in,1'b0};
2'd0  : data_out = {1'b0,1'b0,1'b0,data_in};
endcase
end
endmodule
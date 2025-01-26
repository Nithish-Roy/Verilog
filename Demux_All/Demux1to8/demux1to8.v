module demux1to2(input data_in, input sel, output [1:0] data_out);
assign data_out = sel?{1'b0,data_in}:{data_in,1'b0};
endmodule

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

module demux1to8(input data_in, input wire [2:0] sel , output [7:0] data_out);
wire [1:0] mux_op;
wire [3:0] mux_a,mux_b;
demux1to2 inst1(.data_in(data_in),.sel(sel[2]),.data_out(mux_op));
demux1to4 inst2(.data_in(mux_op[0]),.sel(sel[1:0]),.data_out(mux_a));
demux1to4 inst3(.data_in(mux_op[1]),.sel(sel[1:0]),.data_out(mux_b));
assign data_out = {mux_a,mux_b};
endmodule

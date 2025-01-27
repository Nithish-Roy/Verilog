module usr(
input [3:0] data_in,
input [1:0] sel,
input shift_left_data,
input shift_right_data,
input clk,
input reset,
output reg [3:0] parallel_data,
output  shift_left_out,
output  shift_right_out
);
always @(posedge clk)
begin 
if(!reset)
parallel_data <= 4'b0000;
else begin
case(sel)
2'b01: parallel_data <= {shift_right_data,parallel_data[3:1]};
2'b10: parallel_data <= {parallel_data[2:0],shift_left_data};
2'b11:	parallel_data <= data_in;
default: parallel_data <= parallel_data;
endcase
end
end
assign shift_left_out = data_in[3];
assign shift_right_out = data_in[0];
endmodule

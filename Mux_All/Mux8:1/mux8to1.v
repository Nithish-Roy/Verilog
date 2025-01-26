module mux4to1(input [3:0] in_data, input [1:0] sel, output reg y);
always@(*)
begin 
case (sel)
2'd0 : y=in_data[0];
2'd1 : y=in_data[1];
2'd2 : y=in_data[2];
2'd3 : y=in_data[3];
default : y = 1'b0;
endcase
end
endmodule

module mux2to1(input a,b,sel, output y);
assign y = sel?b:a;
endmodule

module mux8to1(input [7:0] data_in, input [2:0]sel, output y);
wire mux1,mux2;
mux4to1 inst1(.in_data(data_in[7:4]),.sel(sel[1:0]),.y(mux1));
mux4to1 inst2(.in_data(data_in[3:0]),.sel(sel[1:0]),.y(mux2));
mux2to1 inst3(.b(mux1),.a(mux2),.sel(sel[2]),.y(y));
endmodule

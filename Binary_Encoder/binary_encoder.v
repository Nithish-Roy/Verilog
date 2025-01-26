module binary_encoder(input [7:0] data_in, output [2:0] data_out);
assign data_out = {|data_in[7:4],((|data_in[3:2])|(|data_in[7:6])),(data_in[1]|data_in[3]|data_in[5]|data_in[7])};
endmodule
module bitogr #(parameter N = 4)(input [N-1:0] data_in, output[N-1:0]data_out);
genvar i;                            
assign data_out[N-1] = data_in[N-1];
generate 
for (i = 0; i<N-1; i= i+1)begin :loop
assign data_out [i] = data_in[i] ^ data_in[i+1];
end 
endgenerate
endmodule

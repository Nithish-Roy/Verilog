module gtob #(parameter N = 4)(input [N-1:0] data_in, output  [N-1:0] data_out);
genvar i; 
generate
for(i =0; i<N; i=i+1)begin :bg
assign data_out[i] = ^data_in [N-1:i];
end
endgenerate
endmodule  

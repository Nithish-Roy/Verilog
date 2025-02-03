module dpram #(parameter DATA_WIDTH = 8, ADDRESS_WIDTH = 4, DEPTH = 16)(
    input clk,
    input we_a,
	input we_b,
    input [DATA_WIDTH - 1:0] data_in_a,
    input [DATA_WIDTH - 1:0] data_in_b,
    input [ADDRESS_WIDTH - 1:0] addr_a,
    input [ADDRESS_WIDTH - 1:0] addr_b,
    output reg  [DATA_WIDTH - 1:0] data_out_a,
    output reg  [DATA_WIDTH - 1:0]  data_out_b
);

reg [DATA_WIDTH - 1:0] mem [0:DEPTH-1]; 

always @(posedge clk) begin
    if (we_a) 
        mem[addr_a] <= data_in_a; 
    else if (!we_a)
      data_out_a  <= mem[addr_a];	
    
    if (we_b) 
        mem[addr_b] <= data_in_b; 
    else if (!we_b)
      data_out_b  <= mem[addr_b];

end


endmodule

module sram #(parameter DATA_WIDTH = 8, ADDRESS_WIDTH = 4, DEPTH = 16)(
    input clk,
    input we,
    input [DATA_WIDTH - 1:0] data_in,
    input [ADDRESS_WIDTH - 1:0] addr,
    output[DATA_WIDTH - 1:0] data_out
);

reg [DATA_WIDTH - 1:0] mem [0:DEPTH-1]; 

always @(posedge clk) begin
    if (we) 
        mem[addr] <= data_in; 
end
assign data_out = (!we)? mem[addr]: 8'bzzzz_zzzz; //for asynchronous read

endmodule

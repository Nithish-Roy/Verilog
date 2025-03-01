
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2025 05:50:12 PM
// Design Name: 
// Module Name: baud_generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module baud_generator(
    input clk,  // clock
    input reset, // reset
    input [1:0] baud_sel,
    output reg baud_clk // selecting the baud rate
);
    
    reg [14:0] baud_div;
    reg [14:0] count;
    


    always @(*) begin
        case (baud_sel)
            2'b00: baud_div = 15'd1302 * 16;  // 2400 baud
            2'b01: baud_div = 15'd653  * 16;  // 4800 baud
            2'b10: baud_div = 15'd326  * 16;  // 9600 baud
            2'b11: baud_div = 15'd163  * 16;  // 19200 baudto 9600 baud
        endcase 
    end

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            baud_clk <= 0;
            count <= 0;
        end else begin
            if (count >= baud_div) begin
                count <= 0;
                baud_clk <= ~baud_clk;  // Toggle baud_clk
            end else begin
                count <= count + 1;
            end
        end
    end
endmodule

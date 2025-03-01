
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2025 05:50:12 PM
// Design Name: 
// Module Name: top
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


module top(	  
			  input reset,
			  input clk,
			  input sent,
		      input [7:0] d_in,
		      input p_sel,
		      input [1:0]baud_sel,
		      output tx
					);

wire internal_clk;
 uart_tx inst1 (.reset(reset),	
			   .clk(clk),
			   .sent(sent),
		       .d_in(d_in),
		       .baud_clk(internal_clk),
		       .p_sel(p_sel),
		       .tx(tx));	

baud_generator inst2(
     .clk(clk),  // clock
     .reset(reset), // reset
     .baud_sel(baud_sel),
     .baud_clk(internal_clk) // selecting the baud rate
);

endmodule

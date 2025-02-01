module fsm_counter #(parameter NBIT = 5)( 	input clk,
							input rst,
							input up_down,
							output reg [NBIT-1:0] q );

	parameter [1:0] IDLE = 2'b00,
			UP = 2'b01,
			DOWN = 2'b10;
			
				reg [1:0] present;
				reg [1:0] next;

				always @(posedge clk)
					if (!rst)
						present <= IDLE;
					else 
						present <= next;

				always @(up_down,present)begin
				//	next = present;
					case (present)
						IDLE : 	
							if(up_down)
								next = UP;
							else										next = DOWN;
						UP:     
						       	if (!up_down)
								next = DOWN;
						DOWN:   
							if(up_down)
								next = UP;
						default: next = IDLE;
					endcase
				end
					always @(posedge clk, negedge rst)begin
					       if (!rst)
					       		q <= 0;
					       else begin
							case(present)
								UP: q <= q+1;
								DOWN:  q <= q -1;
							endcase
					       end
					end

										
	endmodule

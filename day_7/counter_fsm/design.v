module fsm_counter(	input clk,
			input rst,
			input up,
			input down,
			output reg [1:0] count
);

parameter [2:0] ZERO = 3'b000,
		ONE  = 3'b001,
		TWO  = 3'b010,
		THREE = 3'b011;

			reg [2:0] present;
			reg [2:0] next;
				

  always @(posedge clk)begin
	  if(!rst)begin
					present <= ZERO;
	  				count <= 2'b00;
	  end
				else
					present <= next;
	  				count <= present;
  end
			
  always @(present , up , down)begin
				next = 3'bx;
				
				case(present)
					ZERO:	begin
						if(up)begin
							next = ONE;
					//		
						end
						else if(down)begin
							next = THREE;
					//		
						end
						end

					ONE:	begin
						if(up)begin
							next = TWO;
					//			
						end
						else if(down)begin
							next = ZERO;
					//		
						end
					end
					TWO:	begin
						if(up)begin
							next = THREE;
					//		
						end	
						else if(down)begin
							next = ONE;
					//		
						end		
					end

					THREE:	begin
						if(up)begin
							next = ZERO;
					//		
						end
						else if(down) begin
							next = TWO;
					//		
						end
					end
				endcase
  end
endmodule

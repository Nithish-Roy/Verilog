//moore nonoverlapping
module seqdec(
		input clk,
		input rst,
		input q_in,
		output q );

	parameter [1:0] IDLE = 2'b00, //0
			S0   = 2'b01, //01
			S1   = 2'b10; //010

	reg [1:0] present;
	reg [1:0] next;

	always @(posedge clk , negedge rst)
		if (!rst)begin
			present <= IDLE;
		//	q <= 0;
		end
		else
			present <= next;
	
	always @(present , q_in)begin 
	case (present)
			IDLE:begin	
				if(q_in == 1)begin 
					next = IDLE;
				//	q = 0;
				end	
				else begin 
					next = S0;
				//	q = 0;
				end
			end
			S0: begin
				if(q_in == 1)begin 
					next = S1;
				//	q = 0;
				end 
				else begin
					next = S0;
				//	q = 0;
				end
			end
			S1:	begin		
				if (q_in == 1)begin
					next = IDLE;
				//	q = 0;
				end
				else begin 
					next = S0; //next = IDLE; for non-overlapping
				//	q = 1;
				end
			end
		endcase
		end
	assign q = (present == S1)&&(q_in == 0); 

endmodule






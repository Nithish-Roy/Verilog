module sd(
		input clk,
		input rst,
		input q_in,
		output q);

	parameter [2:0] A = 2'B00,
			B = 2'B01,
			C = 2'B10,
			D = 2'B11;
	
	reg [2:0] present;
	reg [2:0] next;

	always @(posedge clk)
		if(!rst)
			present <= A;
		else
			present <= next;

	always @(present , q_in)
		begin
			
		case (present)
				A: 
					if(!q_in) next = B;
					else 	 next = A;
				B:
					if(q_in) next = C;
					else 	next = B;
				C:
					if(!q_in) next = D;
					else 	 next = A;
				D:	
					if(!q_in) next = A;
					//next = A; //for non_overlaapping
					else next = 	A;

			endcase
		end
	assign q = (present == D);
endmodule

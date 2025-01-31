module flipflop(input clk,
		input rst,
		input j,
		input k,
		output reg q,
		output q_bar);
always @(posedge clk , negedge rst)
	begin
		if(!rst)
			q <= 0;
		else begin 
			case({j,k})
				2'b00: q <= q;
				2'b01: q <= 0;
				2'b10: q <= 1;
				2'b11: q <= ~q;
			endcase
		end
	end
assign q_bar = ~q;
endmodule

//posedge clk  and q_bar as clock 

module asyn_up_counter( input clk,
			input rst,
			output [3:0] q);
wire [3:0] qinter;
	flipflop inst1(clk,rst,1'b1,1'b1,q[0],qinter[0]);
	flipflop inst2(qinter[0],rst,1'b1,1'b1,q[1],qinter[1]);
	flipflop inst3(qinter[1],rst,1'b1,1'b1,q[2],qinter[2]);
	flipflop inst4(qinter[2],rst,1'b1,1'b1,q[3],qinter[3]);
endmodule


//posedge clk and q as clock
module asyn_down_counter( input clk,
			input rst,
			output [3:0] qin);
wire [3:0] q;
	flipflop inst1(clk,rst,1'b1,1'b1,qin[0],q[0]);
	flipflop inst2(qin[0],rst,1'b1,1'b1,qin[1],q[1]);
	flipflop inst3(qin[1],rst,1'b1,1'b1,qin[2],q[2]);
	flipflop inst4(qin[2],rst,1'b1,1'b1,qin[3],q[3]);
endmodule

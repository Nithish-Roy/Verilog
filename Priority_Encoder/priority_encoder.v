module priority_encoder(input [7:0] data_in, output reg [2:0] data_out);
always @(*)
begin 
casex(data_in)
8'b1xxx_xxxx: data_out = 3'b111;
8'bx1xx_xxxx: data_out = 3'b110;
8'bxx1x_xxxx: data_out = 3'b101;
8'bxxx1_xxxx: data_out = 3'b100;
8'bxxxx_1xxx: data_out = 3'b011;
8'bxxxx_x1xx: data_out = 3'b010;
8'bxxxx_xx1x: data_out = 3'b001;
8'bxxxx_xxx1: data_out = 3'b000;
endcase
end
endmodule
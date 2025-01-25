module full_adder(input a,b,c_in, output sum, carry);
assign {carry,sum} = a+b+c_in;
endmodule

module add_sub #(parameter SIZE = 4)(input [SIZE-1:0]a, 
									 input [SIZE-1:0]b, 
									 input CTR, 
									 output[SIZE -1:0]sum, 
									 output carry);
wire [SIZE-1:0] ones_carry;
wire [SIZE-1:0] c;
genvar y;
assign ones_carry[0] = a[0] ^ CTR;
full_adder inst0(.a(ones_carry[0]),.b(b[0]),.c_in(CTR),.sum(sum[0]),.carry(c[0]));
generate
for( y = 1; y<SIZE; y = y+1)begin :add_sub
assign ones_carry[y] = a[y] ^ CTR;
full_adder instn(.a(ones_carry[y]),.b(b[y]),.c_in(c[y-1]),.sum(sum[y]),.carry(c[y]));
end 
endgenerate
assign carry= c[SIZE-1]; 
endmodule

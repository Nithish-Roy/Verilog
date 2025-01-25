module full_adder(input a,b,c_in, output sum, carry);
assign {carry,sum} = a+b+c_in;
endmodule

module four_rca(input [3:0]a, input [3:0]b, input carry_in, output [3:0]sum, output carry);
wire [2:0] c;
full_adder inst1(.a(a[0]),.b(b[0]),.c_in(carry_in),.sum(sum[0]),.carry(c[0]));
full_adder inst2(.a(a[1]),.b(b[1]),.c_in(c[0]),.sum(sum[1]),.carry(c[1]));
full_adder inst3(.a(a[2]),.b(b[2]),.c_in(c[1]),.sum(sum[2]),.carry(c[2]));
full_adder inst4(.a(a[3]),.b(b[3]),.c_in(c[2]),.sum(sum[3]),.carry(carry));
endmodule 	

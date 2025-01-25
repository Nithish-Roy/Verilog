module four_rca_tb();
reg [3:0]a;
reg [3:0]b;
reg carry_in;
wire [3:0]sum; 
wire carry;
four_rca inst_1 (.a(a),.b(b),.carry_in(carry_in),.sum(sum),.carry(carry)) ;
initial
begin 
	$dumpfile("four_rca_tb.vcd");  
	$dumpvars();
$monitor("%0t a = %d b = %d carry_in = %d sum = %d carry = %d",$time,a,b,carry_in,sum,carry);
repeat(6)begin	
#10	a = $random; b = $random; carry_in= $random;
end
end
endmodule

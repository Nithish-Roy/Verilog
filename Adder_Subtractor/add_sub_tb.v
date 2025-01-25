module add_sub_tb();
reg [3:0]a;
reg [3:0]b;
reg CTR;
wire [3:0]sum; 
wire carry;
add_sub inst_1 (.a(a),.b(b),.CTR(CTR),.sum(sum),.carry(carry)) ;
initial
begin 
	$dumpfile("add_sub_tb.vcd");  
	$dumpvars();
$monitor("%0t a = %b b = %b CTR = %b sum = %b carry = %b",$time,a,b,CTR,sum,carry);	
#10	a = $random; b = $random; CTR= $random;
#10	a = $random; b = $random; CTR= $random;
#10	a = $random; b = $random; CTR= $random;
#10	a = $random; b = $random; CTR= $random;
#10	a = $random; b = $random; CTR= $random;
#10	a = $random; b = $random; CTR= $random;
end
endmodule

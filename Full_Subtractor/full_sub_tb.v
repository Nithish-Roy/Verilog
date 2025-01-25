module full_sub_tb;
	reg a,b,c_in;
	wire diff, borrow;
	full_sub uut(.a(a),.b(b),.c_in(c_in),.diff(diff),.borrow(borrow));
	initial begin
	$dumpfile("full_sub_tb.vcd");  
	$dumpvars();
	$monitor("%0t a = %b b = %b c_in = %b diff = %b borrow = %b",$time,a,b,c_in,diff,borrow);
	 a=0; b=0; c_in=0; #5
	 a=0; b=0; c_in=1; #5
	 a=0; b=1; c_in=0; #5                     
	 a=0; b=1; c_in=1; #5
	 a=1; b=0; c_in=0; #5
	 a=1; b=0; c_in=1; #5
	 a=1; b=1; c_in=0; #5
	 a=1; b=1; c_in=1; #5
	 $finish;
	end
endmodule	

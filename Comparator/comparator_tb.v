module comparator_tb #(parameter SIZE = 5)( );
reg [SIZE-1:0] A; 
reg [SIZE-1:0] B; 
wire  aequalsb, agreaterb, alesserb;
comparator uut1(.A(A),.B(B),.aequalsb(aequalsb), .agreaterb(agreaterb), .alesserb(alesserb));
initial begin
$monitor(" %t A = %d , B = %d , aequalsb = %b agreaterb = %b , alesserb = %b",$time,A,B,aequalsb, agreaterb, alesserb); 
$dumpfile("comparator_tb.vcd");
$dumpvars;
end        
initial begin
 repeat(10) begin
 #10;
 A = $random;  B = $random;
 end
end
endmodule

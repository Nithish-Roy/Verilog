module comparator#(parameter SIZE = 5)( input [SIZE-1:0] A, 
										input [SIZE-1:0] B, 
										output reg aequalsb, agreaterb, alesserb);
always@(*)
begin
 aequalsb=1'b0;
 agreaterb=1'b0;
 alesserb=1'b0;
if (A>B) begin
agreaterb = 1'b1;
end
else if(A<B) begin 
alesserb = 1'b1;   
end
else begin 
aequalsb = 1'b1; 
end
end
endmodule 

module d_latch(input en_d,rst_d,d, output reg q_d);
always @(en_d or rst_d or d)
begin 
if (rst_d)begin 
q_d <= 1'b0;
end
else if(en_d) begin
q_d <= d;
end
end
endmodule

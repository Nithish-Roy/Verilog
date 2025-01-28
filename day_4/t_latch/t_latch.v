
module t_latch(input en_t,rst_t,t, output reg q_t);
always @(en_t or rst_t or t)
begin 
if (rst_t)begin 
q_t <= 1'b0;
end
else if(en_t && t) begin
q_t <= ~q_t;
end
end
endmodule

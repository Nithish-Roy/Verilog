module t_ff(input t,clk,rst, output reg q);
always @ (posedge clk or negedge rst)
begin 
if (!rst) begin
q <= 0;
end
else if(t)
begin 
q <= ~q;
end
else begin 
q <= q; 
end
end
endmodule

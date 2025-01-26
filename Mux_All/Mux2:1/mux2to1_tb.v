module mux2to1_tb();
reg a,b,sel;
wire y;
mux2to1 inst1(.a(a),.b(b),.sel(sel),.y(y));
initial 
begin
$monitor("a = %b b = %b sel = %b y = %b",a,b,sel,y);
repeat(10)begin
#5 a = $random; b=$random; sel= $random;
end
end
endmodule

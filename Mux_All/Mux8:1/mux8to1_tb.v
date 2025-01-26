module mux8to1_tb();
reg [7:0]in_data;
reg [2:0]sel;
wire y;
mux8to1 inst1(.data_in(in_data),.sel(sel),.y(y));
initial 
begin
$monitor("in_data = %b sel = %b y = %b",in_data,sel,y);
repeat(10)begin
#5 in_data = $random; sel= $random;
end
end
endmodule

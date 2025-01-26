module btog_tb #(parameter N = 4)();
reg [N-1:0] data_in;
wire [N-1:0]data_out;
bitogr inst1(.data_in(data_in),.data_out(data_out));
initial 
begin
$monitor(" data_in = %b data_out = %b",data_in,data_out);
#5 data_in = $random ; 
#5 data_in = $random ; 
#5 data_in = $random ; 
#5 data_in = $random ; 
end
endmodule

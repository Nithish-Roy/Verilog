module priority_encoder_tb();
reg [7:0]data_in;
wire [2:0] data_out;
priority_encoder uut1(.data_in(data_in),.data_out(data_out));
initial begin
$monitor(" %t data_in = %b , data_out = %b",$time, data_in,data_out); 
$dumpfile("priority_encoder_tb.vcd");
$dumpvars;
end        
initial begin
 repeat(10) begin
 #10;
 data_in = $random;
 end
end
endmodule
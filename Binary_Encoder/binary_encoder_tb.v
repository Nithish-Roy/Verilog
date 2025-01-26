module binary_encoder_tb();
reg [7:0] data_in;
wire [2:0] data_out;
binary_encoder uut(.data_in(data_in),.data_out(data_out));
integer i;
initial begin 
$dumpfile("binary_encoder_tb.vcd");
$dumpvars;
//$monitor(" %t data_in = %b, data_out= %b",$time,data_in,data_out);
end
initial begin
$monitor(" %t data_in = %b, data_out= %b",$time,data_in,data_out);
data_in = 8'b0000_0001;
for (i =0; i<7; i= i+1)begin :loopforshift 
#5;
data_in = data_in << 1;
if (data_in == 8'b0000_0000)
data_in = 8'b0000_0001;
end
end
endmodule
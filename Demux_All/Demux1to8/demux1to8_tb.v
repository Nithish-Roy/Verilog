module demux1to8_tb();
reg data_in;
reg [2:0] sel;
wire [7:0] data_out;
demux1to8 uut1(.data_in(data_in),.sel(sel),.data_out(data_out));
initial  begin 
$dumpfile("demux1to8_tb.vcd");
$dumpvars;
$monitor("data_in = %b, sel=%b , data_out= %b", data_in,sel,data_out);
repeat(10) begin
data_in = $random; sel = $random;
#10;
end
end
endmodule
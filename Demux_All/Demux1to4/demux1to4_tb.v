module demux1to4_tb();
reg data_in;
reg [1:0] sel;
wire [3:0] data_out;
demux1to4 uut1(.data_in(data_in),.sel(sel),.data_out(data_out));
initial  begin 
$dumpfile("demux1to4_tb.vcd");
$dumpvars;
$monitor("data_in = %b, sel=%b , data_out= %b", data_in,sel,data_out);
repeat(10) begin
data_in = $random; sel = $random;
#10;
end
end
endmodule
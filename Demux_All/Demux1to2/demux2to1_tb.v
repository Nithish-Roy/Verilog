module demux1to2_tb();
reg data_in , sel;
wire [1:0] data_out;
demux1to2 uut1(.data_in(data_in),.sel(sel),.data_out(data_out));
initial  begin 
$dumpfile("demux2to1_tb.vcd");
$dumpvars;
$monitor("data_in = %b, sel=%b , data_out= %b", data_in,sel,data_out);
repeat(10) begin
data_in = $random; sel = $random;
#10;
end
end
endmodule
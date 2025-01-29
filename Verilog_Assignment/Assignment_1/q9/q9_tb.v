`timescale 1ns/1ps
module tb;

reg rst, en, d;
wire q;

d_using_mux uut (
    .rst(rst),
    .en(en),
    .d(d),
    .q(q)
);

initial begin
    $dumpfile("d_using_mux_tb.vcd");
    $dumpvars(0, tb);
    
    rst = 1; en = 0; d = 0;
    #10 rst = 0; en = 1; d = 1;
    #10 d = 0;
    #10 en = 0;
    #10 rst = 1;
    #10 rst = 0; en = 1; d = 1;
    #10 $finish;
end

always #5 d = ~d;

endmodule

`timescale 1ns / 1ps
module tb_mux8to1;
    reg [2:0] sel;
    reg [7:0] data_in;
    wire y;
    mux8to1 uut (
        .sel(sel),
        .data_in(data_in),
        .y(y)
    );
    initial begin
        data_in = $random;
        sel = 3'b000; 
        #10;
	$dumpfile("q6.vcd");
	$dumpvars();
        repeat(8) begin
            #10 sel = sel + 1; 
        end
        #10 $finish;
    end
    initial begin
  $monitor("Time=%0t | sel=%b | data_in=%b | y=%b", $time, sel, data_in, y);
    end
endmodule

//Write RTL code for designing an 8:1 mux using a for loop.
module mux8to1(
    input [2:0] sel, 
    input [7:0] data_in, 
    output reg y
);
    integer i;
    always @(*) begin
        y = 0;
        for (i = 0; i < 8; i = i + 1) begin
            if (sel == i)
                y = data_in[i];
        end
    end
endmodule

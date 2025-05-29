module clk_div_100hz (
    input  wire clk_50mhz,
    input  wire reset,
    output reg  clk_100hz
);

    // 19-bit counter to count up to 250,000
    reg [18:0] counter;

    parameter MAX_COUNT = 250000; // Half of 500,000

    always @(posedge clk_50mhz or posedge reset) begin
        if (reset) begin
            counter   <= 0;
            clk_100hz <= 0;
        end else begin
            if (counter == MAX_COUNT - 1) begin
                counter   <= 0;
                clk_100hz <= ~clk_100hz; // Toggle output clock
            end else begin
                counter <= counter + 1;
            end
        end
    end

endmodule

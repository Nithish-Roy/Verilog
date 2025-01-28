module q2(a, b, c, sum);
    input [7:0] a;
    input [7:0] b;
    input [7:0] c;
    output reg [7:0] sum;

    function [7:0] sum_calc(input [7:0] x, input [7:0] y, input [7:0] z);
        sum_calc = x + y + z; 
    endfunction

    always @(*) begin
        sum = sum_calc(a,b,c); 
    end
endmodule

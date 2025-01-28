module q2_tb;
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
wire [7:0] sum;

q2 inst1(.a(a),.b(b),.c(c),.sum(sum));
initial begin 
$monitor(" a= %d b = %d c = %d sum = %d",a,b,c,sum);
end

initial begin
repeat(5)begin 
a = $random;
b = $random;
c = $random;
#5;
end
end
endmodule

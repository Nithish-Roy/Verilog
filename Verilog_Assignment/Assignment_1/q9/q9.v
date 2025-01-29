//Write RTL code for designing a D latch using a 2:1 mux.
`include "/home/roy/Desktop/Git_Hub/MUX_ALL/MUX2TO1/mux2to1.v"
module d_using_mux(input rst, en,d, output q);
wire mux1,mux2;
mux2to1 inst1(.a(q),.b(d),.sel(en),.y(mux1));
mux2to1 inst2(.a(0),.b(1'b0),.sel(en),.y(mux2));
mux2to1 inst3(.a(mux1),.b(mux2),.sel(rst),.y(q));
endmodule

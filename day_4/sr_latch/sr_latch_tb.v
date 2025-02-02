module TB_SR_Latch;
  reg en_s, rst_s, s, r;
  wire q_s;

  SR_Latch uut (
    .en_s(en_s),
    .rst_s(rst_s),
    .s(s),
    .r(r),
    .q_s(q_s)
  );

  initial begin
    $monitor("en_s = %b, rst_s = %b, s = %b, r = %b, q_s = %b", en_s, rst_s, s, r, q_s);

    en_s = 0; rst_s = 0; s = 0; r = 0;
    #10 en_s = 1; rst_s = 0; s = 1; r = 0; 
    #10 en_s = 1; rst_s = 0; s = 0; r = 1; 
    #10 en_s = 1; rst_s = 0; s = 1; r = 1; 
    #10 en_s = 0; rst_s = 1; s = 0; r = 0; 
    #10 $finish;
  end
endmodule

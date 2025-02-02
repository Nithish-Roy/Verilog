module TB_JK_Latch;
  reg en_jk, rst_jk, j, k;
  wire q_jk;

  JK_Latch uut (
    .en_jk(en_jk),
    .rst_jk(rst_jk),
    .j(j),
    .k(k),
    .q_jk(q_jk)
  );

  initial begin
    $monitor("en_jk = %b, rst_jk = %b, j = %b, k = %b, q_jk = %b", en_jk, rst_jk, j, k, q_jk);

    en_jk = 0; rst_jk = 0; j = 0; k = 0;
    #10 en_jk = 1; rst_jk = 0; j = 0; k = 0; 
    #10 en_jk = 1; rst_jk = 0; j = 0; k = 1; 
    #10 en_jk = 1; rst_jk = 0; j = 1; k = 0; 
    #10 en_jk = 1; rst_jk = 0; j = 1; k = 1; 
    #10 en_jk = 0; rst_jk = 1; j = 0; k = 0; 
    #10 $finish;
  end
endmodule

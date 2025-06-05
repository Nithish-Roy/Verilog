module alphabet_pyramid;
int i, j, k;  
  initial begin
    for(i = 1; i <= 5; i = i + 1)
      begin
        for(j = 5; j > i; j = j - 1)
          $write(" ");
        for(k = 1; k <= ((i*2)-1) ; k = k +1)
          $write("%c", 64+i);
       $display("");
      end
    $finish;
  end
endmodule

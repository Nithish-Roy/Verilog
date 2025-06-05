module diamond_pattern;
integer i, j, k;
  
  initial begin
    for(i = 1; i <= 5; i= i+1)
      begin
        for(k = 5 - i; k >= 1; k = k - 1)
          $write(" ");
        for(j = 1; j <= (i*2 - 1); j = j + 1)
          $write("%0d", i);
        $display("");
      end
    
    i = 0; j = 0; k = 0;
    
    for(i = 1; i <= 5; i= i+1)
      begin
        for(k = 1; k <= i; k = k + 1)
          $write(" ");
        for(j = 1 ; j <= (8 - (2*i-1)); j = j + 1)
          $write("%0d",5-i);
      	 $display("");
      end
  end
    
endmodule

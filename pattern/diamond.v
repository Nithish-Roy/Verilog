module pattern_triangle;
int i, j, k;
  
  initial begin
    for(i = 0; i <= 5; i = i+1)
      begin
      for(j = 1; j <= i ; j =j+1)
        $write("%0d", i);
      $display("");
      end
    
    i = 0; j = 0; k = 4;
    
    for(i = 1; i <= 5; i = i+1)
      begin
        for(j = 5; j > i ; j =j-1)
          begin
            $write("%0d", k);
          end
        k = k - 1;
        $display("");
      end
    
  end
endmodule

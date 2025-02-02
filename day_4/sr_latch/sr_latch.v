module SR_Latch(input en_s, rst_s, s, r, output reg q_s);
  always @(en_s or rst_s or s or r)
  begin
    if (rst_s) begin
      q_s <= 1'b0;
    end
    else if (en_s) begin
      if (s && !r) begin
        q_s <= 1'b1;
      end
      else if (!s && r) begin
        q_s <= 1'b0;
      end
    end
  end
endmodule

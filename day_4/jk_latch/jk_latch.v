module JK_Latch(input en_jk, rst_jk, j, k, output reg q_jk);
  always @(en_jk or rst_jk or j or k)
  begin
    if (rst_jk) begin
      q_jk <= 1'b0;
    end
    else if (en_jk) begin
      case ({j, k})
        2'b00: begin
          q_jk <= q_jk;
        end
        2'b01: begin
          q_jk <= 1'b0;
        end
        2'b10: begin
          q_jk <= 1'b1;
        end
        2'b11: begin
          q_jk <= ~q_jk;
        end
      endcase
    end
  end
endmodule

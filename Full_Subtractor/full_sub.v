module full_sub(a,b,c_in,diff,borrow);
input a,b,c_in;
output diff,borrow;
assign {borrow , diff}  = {((~a&b)|~(a^b)&c_in),(a^b^c_in)} ;   //assign using concatenation
endmodule

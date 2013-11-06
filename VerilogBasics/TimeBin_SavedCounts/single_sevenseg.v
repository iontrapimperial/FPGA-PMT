module single_sevenseg (numin, ones);

input [3:0] numin;
output reg [6:0] ones;

reg [5:0] onesbcd;


always@ (numin) 
begin

onesbcd <= numin % 10;

case (onesbcd)

4'h0: ones = 7'b1000000; // 6,5,4,3,2,1,0 
4'h1: ones = 7'b1111001;
4'h2: ones = 7'b0100100;
4'h3: ones = 7'b0110000;
4'h4: ones = 7'b0011001;
4'h5: ones = 7'b0010010;
4'h6: ones = 7'b0000010;
4'h7: ones = 7'b1111000;
4'h8: ones = 7'b0000000;
4'h9: ones = 7'b0011000;
default: ones=7'b1110001;
endcase

end

endmodule

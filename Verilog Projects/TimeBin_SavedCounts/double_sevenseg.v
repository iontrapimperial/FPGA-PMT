module double_sevenseg(s1, tens, ones);


input wire [7:0] s1;

output reg [6:0] tens;
output reg [6:0] ones;

reg [7:0] tensbcd;
reg [7:0] onesbcd;


always@ (s1) 
begin

onesbcd <= s1 % 10;
tensbcd <= s1 / 10;

case (onesbcd)

8'h0: ones = 7'b1000000; // 6,5,4,3,2,1,0 
8'h1: ones = 7'b1111001;
8'h2: ones = 7'b0100100;
8'h3: ones = 7'b0110000;
8'h4: ones = 7'b0011001;
8'h5: ones = 7'b0010010;
8'h6: ones = 7'b0000010;
8'h7: ones = 7'b1111000;
8'h8: ones = 7'b0000000;
8'h9: ones = 7'b0011000;
default: ones=7'b1110001;
endcase


case (tensbcd)

8'h0: tens = 7'b1000000;
8'h1: tens = 7'b1111001;
8'h2: tens = 7'b0100100;
8'h3: tens = 7'b0110000;
8'h4: tens = 7'b0011001;
8'h5: tens = 7'b0010010;
8'h6: tens = 7'b0000010;
8'h7: tens = 7'b1111000;
8'h8: tens = 7'b0000000;
8'h9: tens = 7'b0011000;
default: tens=7'b1110001;
endcase

end

endmodule 
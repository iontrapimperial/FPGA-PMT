/*This module displays a three digit number, usually the counts from one 
(or both) of the PMTs for debugging communication issues.*/
module Triple_SevenSeg(s1, huns, tens, ones);


input wire [15:0] s1;
output reg [6:0] huns;
output reg [6:0] tens;
output reg [6:0] ones;

reg [7:0] hunsbcd;
reg [7:0] tensbcd;
reg [7:0] onesbcd;
reg [7:0] s;

always@ (s1)

begin
s=s1[15:8]; 
onesbcd <= s % 100 % 10;
tensbcd <= s % 100 /10;
hunsbcd <= s /100;

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

case (hunsbcd)

8'h0: huns = 7'b1000000;
8'h1: huns = 7'b1111001;
8'h2: huns = 7'b0100100;
8'h3: huns = 7'b0110000;
8'h4: huns = 7'b0011001;
8'h5: huns = 7'b0010010;
8'h6: huns = 7'b0000010;
8'h7: huns = 7'b1111000;
8'h8: huns = 7'b0000000;
8'h9: huns = 7'b0011000;
default: huns=7'b1110001;
endcase
end

endmodule 
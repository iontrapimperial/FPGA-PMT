module SumCounts(clock, count1, count2, select, sumout, TwoBytes);

input [7:0] count1;
input [7:0] count2;
input [1:0] select;
output reg [15:0] sumout;
output reg TwoBytes;
input clock;

always@(posedge clock) 
begin

case (select)

2'b00: 
begin
sumout[7:0] = count1 + count2;
sumout[15:8]=0;
TwoBytes=0;
end
2'b01: 
begin
sumout[7:0] = count1;
sumout[15:8]=0;
TwoBytes=0;
end
2'b10: 
begin
sumout[7:0] = count2;
sumout[15:8]=0;
TwoBytes=0;
end
2'b11: 
begin 
sumout[7:0] = count1;
sumout[15:8] = count2;
TwoBytes=1;
end

endcase
end
endmodule


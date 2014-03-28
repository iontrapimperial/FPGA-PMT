//Values of two input switches dictate whether PMT1, PMT2, sum
//or both values are passed on
module SumControl (clock,in1,in2,sum);
input clock;
input in1;
input in2;
output reg [1:0] sum;

always@(posedge clock)
begin

sum[0]<=in1;
sum[1]<=in2;

end
endmodule

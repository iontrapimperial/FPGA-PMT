// Adds values of switches to select between time bins (which to display)
module add (in1, in2, select, test);

input in1, in2;
output reg [1:0] select, test;

always @(in1, in2)
begin
select [0] = in1;
select [1] = in2;
test=select;
end
endmodule 
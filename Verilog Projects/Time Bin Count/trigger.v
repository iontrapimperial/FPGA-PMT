module trigger (clk, in, out, reset);

input clk;
input [5:0] in;
output reg [5:0] out;
output reg reset;

always @(posedge clk)
begin

out=in;
reset=!reset;

end
endmodule 
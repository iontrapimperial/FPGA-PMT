module trigger_clock_hundreds (clk, in, out, reset, LED, PIN);

input clk;
input [7:0] in;
output reg [7:0] out=0;
output reg reset, LED, PIN;
reg [31:0] i;

always @(posedge clk)
begin

if (i==32'd250000)//5ms time bin
begin
out<=in;
reset<=1;
LED<=!LED;
i<=0;
end

else 
begin 
i<=i+1;
reset<=0;
end

end
endmodule

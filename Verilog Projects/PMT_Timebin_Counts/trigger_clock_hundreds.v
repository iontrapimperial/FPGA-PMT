module trigger_clock_hundreds (clk, in,LED, PIN, reset, out, constant);

input clk;
input [7:0] in;
output reg [7:0] out=0;
output reg reset=0;
output reg PIN;
output reg LED=0;
reg [31:0] i=32'd0;
output wire [7:0] constant;

assign constant = 8;

always @(posedge clk)
begin

if (i==32'd50000)//0.1ms time bin
begin
out<=in;
reset<=1;
LED<=!LED;
i<=32'd0;
end

else 
begin 
i<=i+1;
reset<=0;
end

end
endmodule

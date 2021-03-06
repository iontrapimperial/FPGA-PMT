module trigger_clock (clk, in, out1, out2, out3, out4, reset, LED);

input clk;
input [3:0] in;
output reg [3:0] out1, out2, out3, out4;
output reg reset, LED;
reg [31:0] i;

always @(posedge clk)
begin

if (i==32'd250000)
begin
out4=out3;
out3=out2;
out2=out1;
out1=in;
reset=1;
LED=!LED;
i=0;
end

else 
begin 
i<=i+1;
reset<=0;
end

end
endmodule 
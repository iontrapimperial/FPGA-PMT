module trigger_clock (zero, clk, in, out, reset, LED);

input clk, zero;
input [15:0] in;
output reg [15:0] out;
output reg reset, LED;
reg [31:0] i;
reg [3:0] k;
reg[15:0] intern;

always @(posedge clk)
begin

if (zero)

out=16'b0;

else if (i==32'd100000000)
begin
intern=in << k;
out = out+intern;
reset=1;
LED=!LED;
i=0;
k=k+4'b0100;
end

else 
begin 
i<=i+1;
reset<=0;
end

end
endmodule 
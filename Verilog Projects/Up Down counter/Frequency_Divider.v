module Frequency_Divider(clock, on_off);


input clock;
output reg on_off;
reg [31:0] count;

always @(posedge clock)
begin

if (count==32'd5000000) 
begin count <= 16'd0;
on_off <= !on_off;
end
else begin
count<=count +1;
end
end
endmodule 
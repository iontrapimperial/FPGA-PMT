module count_holdval (sw_count, clock, sw_out);

input clock, sw_count;
output reg [5:0] sw_out;
reg [5:0] intr;

always@(posedge clock)
begin
if (sw_count)
intr<=intr+1;

else
sw_out=intr; 
intr=6'b0;
end


endmodule 
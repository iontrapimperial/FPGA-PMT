module counter_holdvalue (sw_count, sw_out2, clock, sw_out, toggle, LED2);

input clock, sw_count, toggle;
output reg LED2;
output reg [5:0] sw_out;
output reg [5:0] sw_out2;
reg [5:0] intr;

always@(posedge clock)
begin
if (sw_count) begin 
intr=intr+1;
LED2=!LED2;
if (toggle)
sw_out=intr;

else if (!toggle)
sw_out2=intr;
end

else begin
intr=6'b0;

end


end



endmodule 
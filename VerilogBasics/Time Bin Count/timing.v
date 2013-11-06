module timing (clock, j, LED);

input clock;
output reg j;
output reg LED;
reg [31:0] i;

always @(posedge clock)
begin

if (i== 32'd50000000)
begin
i=0;
j=!j;
LED=!LED;

end

else
begin
i=i+1;
end



end
endmodule 
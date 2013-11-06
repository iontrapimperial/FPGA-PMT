module trig_count (j, switch, out, LED2);

input j, switch;
reg [5:0] intr;
output reg [5:0] out;
output reg LED2=0;

always @(posedge j or posedge switch)
begin

if (j)
begin
LED2<=!LED2;
out<=intr;
//intr<=6'b0;
end

else if (switch)
begin
intr<=intr+1;
end



end
endmodule 
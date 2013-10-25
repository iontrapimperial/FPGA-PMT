module display_switch (num, switch, out1, out2);

input [5:0] num;
input switch;
output reg [5:0] out1;
output reg [5:0] out2;

always @(num)
begin
if(switch)
begin
out1<=num;
out2<=6'b0;
end

else 
begin
out2<=num;
out1<=6'b0;
end

end

endmodule

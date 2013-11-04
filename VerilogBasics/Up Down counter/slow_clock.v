module slow_clock(osc, clock, test);

input osc;
output reg clock;
output reg test;
reg [31:0] keep;

always@(posedge osc)
begin

if (keep<32'd500000000)
begin
keep<=keep+1;
clock<=1'b0;
end

else
begin
clock=1'b1;
test<=test+1;
keep=32'b0;
end

end

endmodule


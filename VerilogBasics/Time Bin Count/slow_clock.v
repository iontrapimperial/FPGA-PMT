module slow_clock(osc, clock, LED);

input osc;
output reg clock, LED;
reg [31:0] keep;

always@(posedge osc)
begin

if (keep==32'd4000000)
begin
clock=!clock;
LED=!LED;
keep=32'b0;
end

else
begin
keep=keep+1;
end

end

endmodule


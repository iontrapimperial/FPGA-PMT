module slow_clock(osc, clock);

input osc;
output clock;
reg [31:0] keep;

always@(posedge osc)
begin

if (keep<32'd5000000)
keep<=keep+1;
clock<=1'b0;

else
clock=1'b1;
keep=32'b0;

end

endmodule


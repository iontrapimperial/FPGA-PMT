module slow_clock(osc, clock);

input osc;
output reg clock;
reg [31:0] keep;

always@(posedge osc)
begin

if (keep<32'd5000000)
begin
keep<=keep+1;
clock<=1'b0;
end

else
begin
clock=1'b1;
keep=32'b0;
end

end

endmodule


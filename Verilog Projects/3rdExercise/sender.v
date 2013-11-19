module sender (numin, send, reset, numout);
input send, reset;
input [5:0] numin;
output reg [5:0] numout;

always @(posedge reset, posedge send)
begin

if (reset)
numout<=6'b0;

else if (send)
numout<=numin;

end

endmodule

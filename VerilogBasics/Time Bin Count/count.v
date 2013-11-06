module count (switch, out, reset);

input switch;
input reset;
output reg [3:0] out;

always @(posedge switch, posedge reset)
begin


 if (reset)

out=0;

else if (switch)

out=out+1;



end

endmodule

/* module that counts button presses. Takes reset from trigger module to reset counts 
each time bin. */

module count (switch, out, reset); 

input switch;
input reset;
output reg [15:0] out; /*16 bit output so that there is space for the number 
to be bit shifted according to its time bin*/

always @(posedge switch, posedge reset)
begin


 if (reset)

out=0;

else if (switch)

out=out+1;



end

endmodule

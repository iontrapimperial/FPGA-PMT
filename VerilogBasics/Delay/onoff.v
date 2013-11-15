//`timescale 1ns/1ns
module onoff (switch, LED, clock1);

input switch, clock1;
output reg LED;

always @(posedge switch)

begin

#1000000000;
 LED=!LED;


end

endmodule

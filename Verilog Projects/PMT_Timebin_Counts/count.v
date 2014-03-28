//Counts photon signals from PMT
module count(switch, reset, out);

input switch, reset;
output reg [7:0] out;

always @(posedge switch, posedge reset)
begin

if (reset)
out<=0;

else if (switch && out<255)
out<=out+1;


end
endmodule

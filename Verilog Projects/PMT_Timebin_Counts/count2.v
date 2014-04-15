//Counts photon signals from PMT
module count2(clk, switch, reset, out);

input switch, reset, clk;
output reg [7:0] out;
reg edgedetect;

always @(posedge clk)
begin
edgedetect<=switch;

if (reset)
out<=0;

else if ((edgedetect == !switch) && out<255)
out<=out+1;


end
endmodule

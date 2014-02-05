module trigger_clock_hundreds (one_switch, two_switch, three_switch, four_switch, 
five_switch, six_switch, seven_switch, eight_switch, clk, in,LED, PIN, reset, out, constant);

input clk;
//Switches to choose timebin size. timebinfactor=(1^(one_switch)+2^(two_switch)+...)*100us
input one_switch, two_switch, three_switch, four_switch, five_switch, six_switch, seven_switch, eight_switch;
input [7:0] in;
output reg [7:0] out=0;
output reg reset=0;
output reg PIN;
output reg LED=0;
reg [21:0] i=21'd0;
wire [7:0] timebinfactor;
output wire [7:0] constant;

assign timebinfactor[0]=one_switch;
assign timebinfactor[1]=two_switch;
assign timebinfactor[2]=three_switch;
assign timebinfactor[3]=four_switch;
assign timebinfactor[4]=five_switch;
assign timebinfactor[5]=six_switch;
assign timebinfactor[6]=seven_switch;
assign timebinfactor[7]=eight_switch;

assign constant = 8;

always @(posedge clk)
begin



if (i==timebinfactor*13'd5000)//timebinfactor*100us time bin
begin
out<=in;
reset<=1;
LED<=!LED;
i<=32'd0;
end

else 
begin 
i<=i+1;
reset<=0;
end

end
endmodule

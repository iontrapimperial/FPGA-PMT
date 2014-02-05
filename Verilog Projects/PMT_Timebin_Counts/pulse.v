module pulse (clock,switch,LED, pulse);

input clock;
input switch;
output reg pulse=0;
reg edgeDetect = 1;
reg [31:0] clk_div;
reg trigger = 0;
reg [2:0] case1 = 0;
output reg LED = 0;


always @(posedge clock)
begin

edgeDetect<=switch;
if(edgeDetect && ~switch)

trigger <= 1;

else
trigger <=0;

/*case(case1)
if (trigger) 
case1 <= 1;
clk_div<=5000000;
1: begin 
pulse<=1;
LED<=!LED;
case1<=2;
end
2: begin 
	pulse<=0;
	case1 <= 0;
	end
0: begin end 
endcase*/

end
endmodule 
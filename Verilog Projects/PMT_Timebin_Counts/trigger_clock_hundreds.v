/*Counts clock cycles until timebin (specified by input switches) is reached, then resets counters,
passes counts on to UART_module and triggers it to send the byte. Switches form a binary number, the 
value of which is multiplied by 100us to give timebin.*/
module trigger_clock_hundreds (one_switch, two_switch, three_switch, four_switch, 
five_switch, six_switch, seven_switch, eight_switch, clk, in,LED, PIN, reset, out, timebinfactorOut, StopRunning, StartButton);

input clk;
//Switches to choose timebin size. timebinfactor=(1^(one_switch)+2^(two_switch)+...)*100us
input one_switch, two_switch, three_switch, four_switch, five_switch, six_switch, seven_switch, eight_switch;
input [15:0] in;
input StartButton;
output reg [15:0] out=0;
output reg reset=0;
output reg PIN;
output reg LED=0;
output reg [7:0] timebinfactorOut;
reg [21:0] i=21'd0;
wire [7:0] timebinfactor;
reg[7:0] timebinChangeDetect;
output reg StopRunning=1; // Changed how this is used. Now related to start button for whole thing.
reg StartRunning;

//Each switch is a bit in 8 bit number forming "timebinfactor"
assign timebinfactor[0]=one_switch;
assign timebinfactor[1]=two_switch;
assign timebinfactor[2]=three_switch;
assign timebinfactor[3]=four_switch;
assign timebinfactor[4]=five_switch;
assign timebinfactor[5]=six_switch;
assign timebinfactor[6]=seven_switch;
assign timebinfactor[7]=eight_switch;


always @(posedge clk)
begin
/*timebinfactorOut<=timebinfactor; //byte of timebin factor so can be sent  to computer (nolonger used)
timebinChangeDetect<=timebinfactor;
if(timebinChangeDetect!=timebinfactor)
begin*/
//StopRunning=1;
//end

//Edge detect to start program
StartRunning<=StartButton;
if(StartRunning && !StartButton)
begin
StopRunning=0;
LED=!LED;
end


if (i==timebinfactor*13'd5000)//timebinfactor*100us time bin
begin
out<=in;
reset<=1;
i<=32'd0;
end

else 
begin 
i<=i+1;
reset<=0;
end

end
endmodule

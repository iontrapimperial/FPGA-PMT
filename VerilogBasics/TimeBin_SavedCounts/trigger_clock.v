module trigger_clock (zero, clk, in, out, reset, LED);

input clk, zero; //clk to defin time bins, zero to set to zero counts in bins
input [15:0] in; //input from count module (button presses)
output reg [15:0] out; //output into time bins
output reg reset, LED; //reset back to count module, LED for tests
reg [31:0] i; //used to set time bin
reg [3:0] k; //used for bit shif
reg[15:0] intern; //used for bit shift

always @(posedge clk)
begin

if (zero) //used to selectc appropriate bits for zeroing according to time bin
begin
if(k==4'b0)
out [3:0]=4'b0;


else if(k==4'b0100)
out[7:4]=4'b0;

else if (k==4'b1000)
out[11:8]=4'b0;

else if(k==4'b1100)
out[15:12]=4'b0;

end

else if (i==32'd100000000) // runs once per time bin 
begin
intern=in << k; //internal variable assigned to the counts shifted into correct time bin placement
out = out+intern; //counts added to time bins of output
reset=1; //reset back to count module, starts count afresh
LED=!LED;
i=0; 
k=k+4'b0100; //changes bit shift amount for appropriate time bin.
end

else // counts i until time step condition met.
begin 
i<=i+1;
reset<=0;
end

end
endmodule 
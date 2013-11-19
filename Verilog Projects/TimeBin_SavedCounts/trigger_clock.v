module trigger_clock (zero, clk, in, out, reset, LED);

input clk, zero; //clk to defin time bins, zero to set to zero counts in bins
input [31:0] in; //input from count module (button presses)
output reg [31:0] out; //output into time bins
output reg reset, LED; //reset back to count module, LED for tests
reg [31:0] i; //used to set time bin
reg [4:0] k; //used for bit shif
reg[31:0] intern; //used for bit shift

always @(posedge clk)
begin

if (zero) //used to selectc appropriate bits for zeroing according to time bin
begin
if(k==5'b0)
out [7:0]=8'b0;

else if(k==5'b01000)
out[15:8]=8'b0;

else if (k==5'b10000)
out[23:16]=8'b0;

else if(k==5'b11000)
out[31:17]=8'b0;

end

else if (i==32'd100000000) // runs once per time bin 
begin
intern=in << k; //internal variable assigned to the counts shifted into correct time bin placement
out = out+intern; //counts added to time bins of output
reset=1; //reset back to count module, starts count afresh
LED=!LED;
i=0; 
k=k+5'b01000; //changes bit shift amount for appropriate time bin.
end

else // counts i until time step condition met.
begin 
i<=i+1;
reset<=0;
end

end
endmodule 
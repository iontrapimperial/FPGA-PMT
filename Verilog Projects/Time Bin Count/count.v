module count (clk,switch, out, reset);

input switch, clk;
input reset;
output reg [7:0] out;
reg edgeAdd, edgeZero;

always @(posedge clk)
begin

edgeAdd<=switch; 
edgeZero<=reset;
 
 if (edgeAdd && ~switch)
 begin
 out=out+1;
 end
 
 if(edgeZero && ~reset)
 out=0;
 
 
 else 
 begin
 end
 





end

endmodule

module count (clk,switch, out, reset);

input switch, clk;
input reset;
output reg [7:0] out;
reg edgeAdd, edgeZero;

always @(posedge clk)// Always trigger always blocks with clock
begin

edgeAdd<=switch; // internal regs used to detect posedge of counts and switch
edgeZero<=reset;
 
 if (edgeAdd && ~switch) // sensitivity condition of if() equivilant to 'posedge'
 begin
 out=out+1;
 end
 
 if(edgeZero && ~reset)
 out=0;
 
 
 else // null option
 begin
 end
 





end

endmodule

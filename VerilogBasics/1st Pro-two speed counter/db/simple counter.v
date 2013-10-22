// This is an example of a simple 32 bit up-counter called simple_counter.v
// It has a single clock input and a 32-bit output port
module simple_counter (input clock , output reg [31:0] counter_out); 
always @ (posedge clock)// on positive clock edge
begin 
 counter_out <= #1 counter_out + 1;// increment counter
end 
endmodule// end of module counter

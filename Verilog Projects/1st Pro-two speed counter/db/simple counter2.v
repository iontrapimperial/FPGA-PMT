// Updated counter with 128 bits
module simple_counter2 (input clock , output reg [127:0] counter_out); 
always @ (posedge clock)// on positive clock edge
begin 
 counter_out <= #1 counter_out + 1;// increment counter
end 
endmodule

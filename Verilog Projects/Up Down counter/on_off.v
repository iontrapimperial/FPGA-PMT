//-----------------------------------------------------
// Design Name : up_counter
// File Name   : up_counter.v
// Function    : Up counter
// Coder      : Deepak
//-----------------------------------------------------
module up_counter    (input enable, input reset, output reg [3:0] out); // inputs to start or reset counting.
//-------------Code Starts Here-------

always @ (posedge enable or reset) 
if (enable) begin
 out <= enable ;
end else if (reset) begin
out <= 4'b0 ;
end

endmodule 

//-----------------------------------------------------
// Design Name : up_counter
// File Name   : up_counter.v
// Function    : Up counter
// Coder      : Deepak
//-----------------------------------------------------
module up_counter_tutorial_noclock    (
nIn     ,  // Output of the counter
enable  ,  // enable for counter
  // clock Input
reset      // reset Input
);
//----------Output Ports--------------
    output reg [3:0] nIn;
//------------Input Ports--------------
     input enable, reset;

   
//-------------Code Starts Here-------
always @(posedge enable or posedge reset) 
begin
if (reset) 
  nIn <= 4'b0;
 
else if (enable) 
  nIn <= nIn + 1;
end


endmodule

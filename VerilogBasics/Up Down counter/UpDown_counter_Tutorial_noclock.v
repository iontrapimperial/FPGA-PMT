//-----------------------------------------------------
// Design Name : up_counter
// File Name   : up_counter.v
// Function    : Up counter
// Coder      : Deepak
//-----------------------------------------------------
module updown_counter_noclock    (
nIn     ,  // Output of the counter
up  ,  
down,  
reset    // reset Input
);
//----------Output Ports--------------
    output reg [3:0] nIn;
//------------Input Ports--------------
     input up, down, reset;
//------------Internal Variables--------

   
//-------------Code Starts Here-------
always @(posedge reset or posedge up or posedge down)
begin
 
if (up)
  nIn = nIn + 1;
else if (down)
  nIn = nIn -1;

else if (reset) 
  nIn = 4'b0;

end



endmodule

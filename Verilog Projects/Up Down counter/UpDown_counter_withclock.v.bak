//-----------------------------------------------------
// Design Name : up_counter
// File Name   : up_counter.v
// Function    : Up counter
// Coder      : Deepak
//-----------------------------------------------------
module updown_counter_withclock    (
nIn     ,  // Output of the counter
up  ,  
down,  
reset,
clock     // reset Input
);
//----------Output Ports--------------
    output reg [3:0] nIn;
//------------Input Ports--------------
     input up, down, reset, clock;
//------------Internal Variables--------

   
//-------------Code Starts Here-------
always @(posedge clock)
begin
if (reset) 
  nIn <= 4'b0;
 
else if (down) 
  nIn <= nIn - 1;

else if (up)
  nIn <= nIn +1;
end



//else if (up)

 //nIn = nIn+1;



endmodule

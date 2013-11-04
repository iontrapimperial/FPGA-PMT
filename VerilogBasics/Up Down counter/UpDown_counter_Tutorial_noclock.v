module updown_count_noclock   (
nIn     ,  // Output of the counter
up  ,  
down,  
reset   // reset Input
);
//----------Output Ports--------------
    output reg [3:0] nIn;//------------Input Ports--------------
     input up, down, reset;
//------------Internal Variables--------

   
//-------------Code Starts Here-------
always @ (posedge up, posedge down, posedge reset)
begin
 
if (up)
  nIn = nIn + 1;
else if (reset) 
  nIn = 4'b0;
else if (down)
  nIn = nIn -1;

end

endmodule

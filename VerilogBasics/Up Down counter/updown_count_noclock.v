module updown_count_noclock   (
nIn     ,  // Output of the counter
up  ,  
down,  
reset,
clock   // reset Input
);

    output reg [3:0] nIn=4'b0;
	 

     input up, down, reset,clock;

always @ (posedge up, posedge down, posedge reset)
begin


if (reset)
 nIn<=4'b0;
else if (up)
 nIn=nIn+1;
else if (down) 
 nIn=nIn-1;


end

endmodule

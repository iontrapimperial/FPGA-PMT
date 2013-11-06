module updown_count_noclock   (
nIn     ,  // Output of the counter
up  ,  
down,  
reset,
clock   // reset Input
);

    output reg [3:0] nIn=4'b0;
	 reg [31:0] i, j;
	  reg k, l;
     input up, down, reset,clock;

always @ (posedge up, posedge down, posedge reset)
begin
for (j=0; j<100; j = j+1) begin
l=1;
for (i = 0; i < 4999; i = i +1) begin
k=1;
   	end
		end
if (reset)
 nIn<=4'b0;
else if (up)
 nIn=nIn+1;
else if (down) 
 nIn=nIn-1;


end

endmodule

/* This counter witten to run sycronously as it is recommended that always
block are only triggered by clock edges. 
The sensitiveity condition of the if statements have been chosen so that the
positive edge of teh signal to be counted (switch) triggers the 'counting state',
where as the reset pulse triggers the reset state.
At first the case statement seem redundant but we found it reduces the fluctuation
of the counts.
While the module does operate well for the most part we have found it still 
fluctuates much mroe than the asynchronous counter. */

module countSync (clk,switch, out, reset, LED, LED2);

input switch, clk;
input reset;
output reg LED, LED2;
output reg [7:0] out=0;
reg edgeAdd=1'b1; 
reg [2:0] state=2'b0;

always @(posedge clk)// Always trigger always blocks with clock
begin

edgeAdd<=switch; // internal regs used to detect posedge of counts and switch
//edgeZero<=reset;


if (edgeAdd && ~switch && ~reset) /* sensitivity condition of if() equivilant to 'posedge'
													~reset included to make if statemetns mutually exclusive*/
begin
 state<=2'b00;
end
 
 
else if(reset)//5ms time bin
begin
 state<=2'b01;
 end


else begin
state<=2'b10;
end

case(state)
2'b00: begin
   out<=out+1;
	end
2'b01: begin
	out<=0;
	end
2'b10: begin
			LED2<=0;
			end

endcase

end

endmodule

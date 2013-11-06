module bit_downshift (in, out3, out2, out1, out0);

input [15:0] in;
output reg [3:0] out0, out2, out3, out1;

always @(in)
begin

out0=in;
out1=in>>4'b0100;
out2=in>>4'b1000;
out3=in>>4'b1100;

end
endmodule


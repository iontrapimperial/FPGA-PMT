module SevenSegmentDisplayDecoder(ssOut, nIn);
  output reg [13:0] ssOut; 

  input [3:0] nIn;
 

  // ssOut format {g, f, e, d, c, b, a}

  always @(nIn)
    case (nIn)
      4'h0: ssOut = 14'b01111110111111; 
	  4'h1: ssOut = 14'b01111110000110; 
	  4'h2: ssOut = 14'b01111111011011;
      4'h3: ssOut = 14'b01111111001111;
      4'h4: ssOut = 14'b01111111100110;
      4'h5: ssOut = 14'b01111111101101;
      4'h6: ssOut = 14'b01111111111101;
      4'h7: ssOut = 14'b01111110000111;
      4'h8: ssOut = 14'b01111111111111;
      4'h9: ssOut = 14'b01111111100111;
	  4'hA: ssOut= 14'b00001100111111;
	  4'hB: ssOut= 14'b00001100000110;
	  4'hC: ssOut= 14'b00001101011011;
	  4'hD: ssOut= 14'b00001101001111;
	  4'hE: ssOut= 14'b00001101100110;
	  4'hF: ssOut= 14'b00001101101101; 
      default: ssOut = 14'b10010011001010;
    endcase

	
endmodule 
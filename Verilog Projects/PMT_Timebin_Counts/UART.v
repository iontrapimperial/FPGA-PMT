`timescale 1ns / 1ps
// Documented Verilog UART
// Copyright (C) 2010 Timothy Goddard (tim@goddard.net.nz)
// Distributed under the MIT licence.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
// 

/*UART Module takes byte (or 2 bytes) from PMT1, PMT2, their sum (or both PMT values). Sends one low start bit,
followed by the byte as a bitstring and a high stop bit, this whole process is repeated if two bytes are sent. Finally 
tx returns to the idle high state.*/ 
module uart(
    input clk, // The master clock for this module
    input rst, // Synchronous reset.
    input rx_line, // Incoming serial line
	 
    output tx, // Outgoing serial line
    input transmit, // Indicate to transmit
    input [15:0] tx_byte, // Bytes to transmit
	 input [7:0] timebinfactor,
	 input StopUART,
	 input SendTimebinButton,
	 input TwoBytes,
	 
    output received, // Indicated that a byte has been received.
    output [7:0] rx_byte, // Byte received
    output is_receiving, // Low when receive line is idle.
    output is_transmitting, // Low when transmit line is idle.
	 output reg [7:0] timebinOUT,
	 
	 output reg tx_Done, //Goes high for one tick after stop bit transmission.
	 output reg tx_test,
    output recv_error, // Indicates error in receiving packet.
	 
	 output ClearToSend,
	 
	 output reg LED=0
	 
    );
 
parameter CLOCK_DIVIDE 		= 3;
parameter CLOCK_DIVIDE2	= 1302; //1302 = clock rate (50Mhz) / (baud rate (9600) * 4)
parameter CLOCK_DIVIDE3 = 868;	
parameter CLOCK_DIVIDE4 = 109; // baud rate 115200
parameter CLOCK_DIVIDE5 = 54; //baud rate = 230400
// States for the receiving state machine.
// These are just constants, not parameters to override.
parameter RX_IDLE 			= 0;
parameter RX_CHECK_START 	= 1;
parameter RX_READ_BITS 		= 2;
parameter RX_CHECK_STOP 	= 3;
parameter RX_DELAY_RESTART = 4;
parameter RX_ERROR 			= 5;
parameter RX_RECEIVED 		= 6;
 
// States for the transmitting state machine.
// Constants - do not override.
parameter TX_IDLE 			= 0;
parameter TX_IDLE2         =4;
parameter TX_SENDING1      = 1;
parameter TX_SENDING2      = 2;
parameter TX_DELAY_RESTART1 = 3; 

parameter TXIdle1 = 0;
parameter TXSending1= 1;
parameter TXIdle2=2;
parameter TXSending2=3;
parameter TX_DELAYRESTART=4;

reg [10:0] rx_clk_divider = CLOCK_DIVIDE5;
reg [10:0] tx_clk_divider = CLOCK_DIVIDE5;
 

reg [2:0] recv_state = RX_IDLE;
reg [5:0] rx_countdown;
reg [3:0] rx_bits_remaining;
reg [7:0] rx_data;
 
reg tx_out = 1'b1;
reg [1:0] tx_state = TX_IDLE;
reg [5:0] tx_countdown;
reg [3:0] tx_bits_remaining;
reg [7:0] tx_data;


reg SendTimebinBool=0;
reg SendTimebin=0;

assign received = recv_state == RX_RECEIVED;
assign recv_error = recv_state == RX_ERROR;
assign is_receiving = recv_state != RX_IDLE;
assign rx_byte = rx_data;

 
assign tx = tx_out;
assign is_transmitting = tx_state != TX_IDLE;

assign ClearToSend = ~(recv_state == RX_IDLE); //CTS low to allow data. High to stop it.



reg [2:0] Buffer = 0;

reg rx = 1;

always@(posedge clk)
begin	

	Buffer <= { rx_line, Buffer[2], Buffer[1]};

	if(Buffer == 3'b111)
	begin
		rx <= 1;
	end
	else if(Buffer == 3'b000)
	begin
		rx <= 0;
	end

end

 
always @(posedge clk) 
begin

SendTimebin <= SendTimebinButton;
if(~SendTimebin && SendTimebinButton)
begin
SendTimebinBool<=1;
end

tx_Done<=0;

	if (rst) begin
		recv_state = RX_IDLE;
		tx_state = TX_IDLE;
	end
 
	// The clk_divider counter counts down from
	// the CLOCK_DIVIDE constant. Whenever it
	// reaches 0, 1/16 of the bit period has elapsed.
   // Countdown timers for the receiving and transmitting
	// state machines are decremented.
	rx_clk_divider = rx_clk_divider - 1;
	if (!rx_clk_divider) begin
		rx_clk_divider = CLOCK_DIVIDE5;
		rx_countdown = rx_countdown - 1;
	end
	tx_clk_divider = tx_clk_divider - 1;
	if (!tx_clk_divider) begin
		tx_test=!tx_test;
		tx_clk_divider = CLOCK_DIVIDE5;
		tx_countdown = tx_countdown - 1;
	end
 timebinOUT=timebinfactor;
 
	// Receive state machine
	case (recv_state)
	
		RX_IDLE: begin
			// A low pulse on the receive line indicates the
			// start of data.
			if (!rx) begin
				// Wait half the period - should resume in the
				// middle of this first pulse.
				rx_clk_divider = CLOCK_DIVIDE5;
				rx_countdown = 2;
				recv_state = RX_CHECK_START;
			end
		end
		RX_CHECK_START: begin
			if (!rx_countdown) begin
				// Check the pulse is still there
				if (!rx) begin
					// Pulse still there - good
					// Wait the bit period to resume half-way
					// through the first bit.
					rx_countdown = 4;
					rx_bits_remaining = 8;
					recv_state = RX_READ_BITS;
				end else begin
					// Pulse lasted less than half the period -
					// not a valid transmission.
					recv_state = RX_ERROR;
				end
			end
		end
		RX_READ_BITS: begin
			if (!rx_countdown) begin
				// Should be half-way through a bit pulse here.
				// Read this bit in, wait for the next if we
				// have more to get.
				rx_data = {rx, rx_data[7:1]};
				rx_countdown = 4;
				rx_bits_remaining = rx_bits_remaining - 1;
				recv_state = rx_bits_remaining ? RX_READ_BITS : RX_CHECK_STOP;
			end
		end
		RX_CHECK_STOP: begin
			if (!rx_countdown) begin
				// Should resume half-way through the stop bit
				// This should be high - if not, reject the
				// transmission and signal an error.
				recv_state = rx ? RX_RECEIVED : RX_ERROR;
			end
		end
		RX_DELAY_RESTART: begin
			// Waits a set number of cycles before accepting
			// another transmission.
			recv_state = rx_countdown ? RX_DELAY_RESTART : RX_IDLE;
		end
		RX_ERROR: begin
			// There was an error receiving.
			// Raises the recv_error flag for one clock
			// cycle while in this state and then waits
			// 2 bit periods before accepting another
			// transmission.
			rx_countdown = 8;
			recv_state = RX_DELAY_RESTART;
		end
		RX_RECEIVED: begin
			// Successfully received a byte.
			// Raises the received flag for one clock
			// cycle while in this state.
			recv_state <= RX_IDLE;
		end
	endcase
 
	// Transmit state machine
	case (tx_state)
		TXIdle1: begin
			if (transmit && ~StopUART) begin
				// If the transmit flag is raised in the idle
				// state, start transmitting the current content
				// of the tx_byte input.
				tx_data = tx_byte[7:0];
				// Send the initial, low pulse of 1 bit period
				// to signal the start, followed by the data
				tx_clk_divider = CLOCK_DIVIDE5;
				tx_countdown = 4;
				tx_out = 0;
				tx_bits_remaining = 8;
				tx_state = TXSending1;
			end
		end
		TXSending1: begin
			if (!tx_countdown) begin
				if (tx_bits_remaining) begin
				//Sends 1 bit per tx_countdown of 4
					tx_bits_remaining = tx_bits_remaining - 1;
					tx_out = tx_data[0];
					//All bits in byte shifted down by 1 after bit sent
					tx_data = {1'b0, tx_data[7:1]};
					tx_countdown = 4;
					tx_state = TXSending1;
				end else if (!tx_bits_remaining) begin
					// Set delay to send out one stop bit.
					tx_out = 1;
					tx_countdown = 4;
					if(!TwoBytes)
					begin
					tx_state = TX_DELAYRESTART;
					end
					else if(TwoBytes)
					begin
					tx_state = TXIdle2;
					end
				end
			end
			else begin
			//do nout
			end
		end
		//Second Idle state to send one start bit before second byte
		TXIdle2: 
			if(!tx_countdown) begin
			 begin
			tx_clk_divider = CLOCK_DIVIDE5;
				tx_countdown = 4;
				tx_out = 0;
				tx_bits_remaining = 8;
				tx_state = TXSending2;
				//Data to send set to second byte of tx_byte (counts from PMT2)
				tx_data=tx_byte[15:8];
				LED=!LED;
			end
			end
		
		//Sending PMT2 count
		TXSending2: begin
			if (!tx_countdown) begin
				if (tx_bits_remaining) begin
					tx_bits_remaining = tx_bits_remaining - 1;
					tx_out = tx_data[0];
					tx_data = {1'b0, tx_data[7:1]};
					tx_countdown = 4;
					tx_state = TXSending2;
				end else if (!tx_bits_remaining) begin
					// Set delay to send out 1 stop bit.
					tx_out = 1;
					tx_countdown = 4;
					tx_state = TX_DELAYRESTART;
				
					
					end
					end
					end

		TX_DELAYRESTART: begin
			// Wait until tx_countdown reaches the end before
			// we send another transmission. This covers the
			// "stop bit" delay.
			
			//tx_state = tx_countdown ? TX_DELAY_RESTART : TX_IDLE;
			if(tx_countdown)
			begin
				tx_state = TX_DELAYRESTART;
				end
			else
			begin
				tx_Done <= 1;
				tx_state = TXIdle1;
				SendTimebinBool<=0;
			end
		end
	endcase
end
 
endmodule 
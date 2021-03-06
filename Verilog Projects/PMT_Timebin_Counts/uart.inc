-- WARNING: Do NOT edit the input and output ports in this file in a text
-- editor if you plan to continue editing the block that represents it in
-- the Block Editor! File corruption is VERY likely to occur.

-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.


-- Generated by Quartus II 64-Bit Version 13.0 (Build Build 232 06/12/2013)
-- Created on Wed Dec 11 10:15:39 2013

FUNCTION uart (clk, rst, rx_line, transmit, tx_byte[7..0])
	WITH (CLOCK_DIVIDE, RX_IDLE, RX_CHECK_START, RX_READ_BITS, RX_CHECK_STOP, RX_DELAY_RESTART, RX_ERROR, RX_RECEIVED, TX_IDLE, TX_SENDING, TX_DELAY_RESTART)
	RETURNS (tx, received, rx_byte[7..0], is_receiving, is_transmitting, tx_Done, recv_error, ClearToSend, test, test2);

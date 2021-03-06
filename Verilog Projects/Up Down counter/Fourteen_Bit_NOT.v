// megafunction wizard: %LPM_INV%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: lpm_inv 

// ============================================================
// File Name: Fourteen_Bit_NOT.v
// Megafunction Name(s):
// 			lpm_inv
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 7.2 Build 151 09/26/2007 SJ Web Edition
// ************************************************************


//Copyright (C) 1991-2007 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module Fourteen_Bit_NOT (
	data,
	result);

	input	[13:0]  data;
	output	[13:0]  result;

	wire [13:0] sub_wire0;
	wire [13:0] result = sub_wire0[13:0];

	lpm_inv	lpm_inv_component (
				.data (data),
				.result (sub_wire0));
	defparam
		lpm_inv_component.lpm_type = "LPM_INV",
		lpm_inv_component.lpm_width = 14;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: nBit NUMERIC "14"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_INV"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "14"
// Retrieval info: USED_PORT: data 0 0 14 0 INPUT NODEFVAL data[13..0]
// Retrieval info: USED_PORT: result 0 0 14 0 OUTPUT NODEFVAL result[13..0]
// Retrieval info: CONNECT: @data 0 0 14 0 data 0 0 14 0
// Retrieval info: CONNECT: result 0 0 14 0 @result 0 0 14 0
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL Fourteen_Bit_NOT.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL Fourteen_Bit_NOT.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Fourteen_Bit_NOT.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Fourteen_Bit_NOT.bsf TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Fourteen_Bit_NOT_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Fourteen_Bit_NOT_bb.v TRUE
// Retrieval info: LIB_FILE: lpm

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:47:58 02/28/2020
// Design Name:   ascii_converter
// Module Name:   F:/fpga/optional_question/test_ascii.v
// Project Name:  optional_question
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ascii_converter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ascii;

	// Inputs
	reg [0:7] in;

	// Outputs
	wire [0:7] out;
	wire cap;

	// Instantiate the Unit Under Test (UUT)
	ascii_converter uut (
		.out(out), 
		.cap(cap), 
		.in(in)
	);

	initial begin
   in=8'd66;
	#50;
   in=8'd97;
	#50;
	in=8'd99;
	#50;
	end
      
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:59:53 02/29/2020
// Design Name:   max4bit
// Module Name:   F:/fpga/q3-hw1/test_max4bit.v
// Project Name:  q3-hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: max4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_max4bit;

	// Inputs
	reg s1;
	reg s0;
	reg i0;
	reg i1;
	reg i2;
	reg i3;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	max4bit uut (
		.out(out), 
		.s1(s1), 
		.s0(s0), 
		.i0(i0), 
		.i1(i1), 
		.i2(i2), 
		.i3(i3)
	);

	initial begin
		// Initialize Inputs
		s1 = 0;
		s0 = 0;
		i0 = 1;
		i1 = 0;
		i2 = 0;
		i3 = 0;
		#50;
      s1 = 0;
		s0 = 1;
		i0 = 1;
		i1 = 0;
		i2 = 1;
		i3 = 0;
		#50;
		s1 = 1;
		s0 = 0;
		i0 = 1;
		i1 = 1;
		i2 = 1;
		i3 = 0;
		#50;
		s1 = 1;
		s0 = 1;
		i0 = 0;
		i1 = 0;
		i2 = 1;
		i3 = 1;
		#50;
		
		// Add stimulus here

	end
      
endmodule


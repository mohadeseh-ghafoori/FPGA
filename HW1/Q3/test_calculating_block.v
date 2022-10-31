`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:23:31 02/29/2020
// Design Name:   calculatig_block
// Module Name:   F:/fpga/q3-hw1/test_calculating_block.v
// Project Name:  q3-hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: calculatig_block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_calculating_block;

	// Inputs
	reg [0:3] a;
	reg [0:3] b;
	reg s0;
	reg s1;

	// Outputs
	wire [0:3] out;

	// Instantiate the Unit Under Test (UUT)
	calculatig_block uut (
		.out(out), 
		.a(a), 
		.b(b), 
		.s0(s0), 
		.s1(s1)
	);

	initial begin
		// Initialize Inputs

		a = 4'd2;
		b = 4'd3;
		s0 = 0;
		s1 = 0;
		#50;
		a = 4'd8;
		b = 4'd2;
		s0 = 1;
		s1 = 0;
		#50;
		a = 4'd11;
		b = 4'd2;
		s0 = 0;
		s1 = 1;
		#50;
		a = 4'd15;
		b = 4'd2;
		s0 = 1;
		s1 = 1;
		#50;
        
		// Add stimulus here

	end
      
endmodule


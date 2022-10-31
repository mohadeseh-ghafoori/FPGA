`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:54:43 02/28/2020
// Design Name:   cmp8bit
// Module Name:   F:/fpga/optional_question/test_cmp8bit.v
// Project Name:  optional_question
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cmp8bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_cmp8bit;

	// Inputs
	reg [0:7] a;
	reg [0:7] b;

	// Outputs
	wire ahigher;
	wire alower;
	wire asame;

	// Instantiate the Unit Under Test (UUT)
	cmp8bit uut (
		.ahigher(ahigher), 
		.alower(alower), 
		.asame(asame), 
		.a(a), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		a =8'b00001111;
		b =8'b00001111;
      #50;
		a =8'b10001111;
		b =8'b00001111;
      #50;
		a =8'b00001111;
		b =8'b11001111;
      #50;
        
		// Add stimulus here

	end
      
endmodule


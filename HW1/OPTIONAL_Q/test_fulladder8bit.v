`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:00:51 02/29/2020
// Design Name:   fulladder8bit
// Module Name:   F:/fpga/optional_question/test_fulladder8bit.v
// Project Name:  optional_question
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fulladder8bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fulladder8bit;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg cin;

	// Outputs
	wire [7:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	fulladder8bit uut (
		.sum(sum), 
		.cout(cout), 
		.a(a), 
		.b(b), 
		.cin(cin)
	);

	initial begin
		// Initialize Inputs
		a = 10;
		b = 5;
		cin = 0;
		#50;
		a=32;
		b=33;
		#50;
		a=-32;
		b=33;
		#50;
		
        
		// Add stimulus here

	end
      
endmodule


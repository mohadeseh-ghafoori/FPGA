`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:53:38 03/18/2020
// Design Name:   barrel
// Module Name:   E:/fpga/barrel_8bit/test_barrel.v
// Project Name:  barrel_8bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: barrel
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_barrel;

	// Inputs
	reg [7:0] in;
	reg [2:0] shift_mag;
	reg ctrl;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	barrel uut (
		.out(out), 
		.in(in), 
		.shift_mag(shift_mag), 
		.ctrl(ctrl)
	);

	initial begin
		// Initialize Inputs
		in = 010110011;
		shift_mag = 3;
		ctrl = 1;
		#50;
		in = 11011100;
		shift_mag = 2;
		ctrl = 0;
		#50;       
		// Add stimulus here

	end
      
endmodule


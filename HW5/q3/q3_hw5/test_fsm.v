`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:38:20 05/28/2020
// Design Name:   fsm
// Module Name:   E:/fpga/q3_hw5/test_fsm.v
// Project Name:  q3_hw5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fsm;

	// Inputs
	reg [1:0] in;
	reg clk;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	fsm uut (
		.out(out), 
		.in(in), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		clk = 0;
		@(negedge clk) in=1;
		@(negedge clk) in=2;
		@(negedge clk) in=1;
		@(negedge clk) in=3;
		@(negedge clk) in=0;
		@(negedge clk) in=2;
		@(negedge clk) in=1;
		

	end
	
	always #10 clk<=~clk;
      
endmodule


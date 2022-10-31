`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:33:44 05/07/2020
// Design Name:   top
// Module Name:   E:/fpga/q5_hw4/test_top.v
// Project Name:  q5_hw4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_top;

	// Inputs
	reg [7:0] data_in;
	reg data_valid;
	reg clk_in;
	reg reset;

	// Outputs
	wire [7:0] data_out;
	wire data_valid_out;
	wire clk_100;
	wire clk_250;
	wire empty;
	wire full;
	wire locked;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.data_out(data_out), 
		.data_valid_out(data_valid_out), 
		.clk_100(clk_100), 
		.clk_250(clk_250), 
		.empty(empty), 
		.full(full), 
		.locked(locked), 
		.data_in(data_in), 
		.data_valid(data_valid), 
		.clk_in(clk_in), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		data_valid=0;
      data_in=0;
		clk_in = 0;
		reset = 0;
		wait(locked);
		#200;
		@(negedge clk_250) 
		data_valid=1;
		data_in=8;
		@(negedge clk_250) data_in=10;
		@(negedge clk_250) data_in=2;
		@(negedge clk_250) data_in=4;
		@(negedge clk_250) data_in=0;
		@(negedge clk_250) data_valid=0;
		@(negedge clk_250) data_valid=1;
		data_in=1;
		@(negedge clk_250) data_in=14;
		@(negedge clk_250) data_in=2;
		@(negedge clk_250) data_in=3;
		@(negedge clk_250) data_in=0;
		@(negedge clk_250) data_in=0;
      @(negedge clk_250) data_valid=0;
	end
      always #10 clk_in<=~clk_in;
      
endmodule


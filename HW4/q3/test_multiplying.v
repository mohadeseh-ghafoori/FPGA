`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:31:30 04/30/2020
// Design Name:   multiplying
// Module Name:   E:/fpga/q3_hw4/test_multiplying.v
// Project Name:  q3_hw4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multiplying
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_multiplying;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg clk;
	reg start_multiply;
	reg start_initialize;
   reg [6:0] i=1;
	// Outputs
	wire [15:0] c;

	// Instantiate the Unit Under Test (UUT)
	multiplying uut (
		.c(c), 
		.a(a), 
		.b(b), 
		.clk(clk), 
		.start_multiply(start_multiply), 
		.start_initialize(start_initialize)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		clk = 0;
		start_multiply = 0;
		start_initialize = 1;
      #10 start_initialize = 0;
		for( i=1;i<=64; i=i+1 ) begin
		@(negedge clk) a=i;
		b=i+1;
		end
		#20;
      start_multiply = 1;
		#10 start_multiply = 0;
		#650;
		start_initialize = 1;
      #10 start_initialize = 0;
		for( i=1;i<=64; i=i+1 ) begin
		@(negedge clk) a=i+1;
		b=i+2;
		end
		#20;
      start_multiply = 1;
		#10 start_multiply = 0;
		
	end
    always #5 clk<=~clk;  
endmodule


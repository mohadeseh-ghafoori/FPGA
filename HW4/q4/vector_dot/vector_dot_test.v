`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:00:05 05/03/2020
// Design Name:   vectors_dot
// Module Name:   E:/fpga/vector_dot/vector_dot_test.v
// Project Name:  vector_dot
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vectors_dot
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vector_dot_test;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg clk;
	reg start_initialize;
	reg start_multiply;
   reg [6:0] i=0;
	// Outputs
	wire [21:0] c;
	wire data_valid;

	// Instantiate the Unit Under Test (UUT)
	vectors_dot uut (
		.c(c), 
		.data_valid(data_valid), 
		.a(a), 
		.b(b), 
		.clk(clk), 
		.start_initialize(start_initialize), 
		.start_multiply(start_multiply)
	);

	initial begin
		// Initialize Inputs
		a=0;
		b=0;
		clk = 0;
		start_multiply = 0;
		start_initialize = 1;
      #10 start_initialize = 0;
		for( i=0;i<=64; i=i+1 ) begin
		@(negedge clk) a=1;
		b=2;
		end
		#20;
      start_multiply = 1;
		#10 start_multiply = 0;
		
		#650;
		a=2;
		b=3;
		start_initialize = 1;
      #10 start_initialize = 0;
		for( i=1;i<=64; i=i+1 ) begin
		@(negedge clk) a=2;
		b=3;
		end
      start_multiply = 1;
		#10 start_multiply = 0;
		
	end
    always #5 clk<=~clk; 
      
endmodule


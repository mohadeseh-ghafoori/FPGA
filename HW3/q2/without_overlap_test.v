`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:27:22 04/03/2020
// Design Name:   detector_without_overlap
// Module Name:   E:/fpga/sequence_detector/without_overlap_test.v
// Project Name:  sequence_detector
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: detector_without_overlap
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module without_overlap_test;

	// Inputs
	reg [3:0] string1;
	reg string2;
	reg clk;

	// Outputs
	wire [3:0] n;

	// Instantiate the Unit Under Test (UUT)
	detector_without_overlap uut (
		.n(n), 
		.string1(string1), 
		.string2(string2), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		string1 = 4'b0110;
		string2 = 0;
		clk = 0;
       @(negedge clk)  string2 = 1;                                            
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 0;
		 @(negedge clk)  string2 = 0;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 0;
		 @(negedge clk)  string2 = 0;
		 @(negedge clk)  string2 = 0;
		 @(negedge clk)  string2 = 0;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 0;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 0;
		 @(negedge clk)  string2 = 0;
		 @(negedge clk)  string2 = 0;
		 @(negedge clk)  string2 = 1;
		 
		 
		 @(negedge clk)  string1 = 4'b1111;
		 @(negedge clk)  string2 = 1;
       @(negedge clk)  string2 = 1;                                            
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 0;
		 @(negedge clk)  string2 = 0;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 0;	
		 
		 
		 @(negedge clk)  string1 = 4'b1111;
		 @(negedge clk)  string2 = 0;
       @(negedge clk)  string2 = 0;                                            
		 @(negedge clk)  string2 = 0;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 0;
		 @(negedge clk)  string2 = 0;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 1;
		 @(negedge clk)  string2 = 0;	

	end
      always #20 clk<=~clk; 
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:56:44 04/03/2020
// Design Name:   detector_overlap
// Module Name:   E:/fpga/sequence_detector/overlap_test.v
// Project Name:  sequence_detector
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: detector_overlap
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module overlap_test;

	// Inputs
	reg [3:0] string1;
	reg string2;
	reg clk;

	// Outputs
	wire [3:0] n;

	// Instantiate the Unit Under Test (UUT)
	detector_overlap uut (
		.n(n), 
		.string1(string1), 
		.string2(string2), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		string1 =4'b0110;
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
		 
		 @(negedge clk) string1 = 4'b1111;
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
        
		// Add stimulus here
	end
     always #20 clk<=~clk; 
endmodule


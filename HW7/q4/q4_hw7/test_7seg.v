`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:32:24 07/08/2020
// Design Name:   sev_seg_display
// Module Name:   E:/fpga/q4_hw7/test_7seg.v
// Project Name:  q4_hw7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sev_seg_display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_7seg;

	// Inputs
	reg [3:0] in_num;
	reg clk;

	// Outputs
	wire [6:0] out;

	// Instantiate the Unit Under Test (UUT)
	sev_seg_display uut (
		.out(out), 
		.in_num(in_num), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		in_num = 0;
		clk = 0;
		@(negedge clk) in_num=5;
      @(negedge clk) in_num=13;
      @(negedge clk) in_num=8;
	end
    
  always #5 clk<=~clk;
	 
endmodule


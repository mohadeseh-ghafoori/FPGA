`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:29:35 05/06/2020
// Design Name:   top
// Module Name:   E:/fpga/q1_hw4/test_top.v
// Project Name:  q1_hw4
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
	reg data_valid;
	reg [3:0] data;
	reg clk;

	// Outputs
	wire [3:0] data_out;
	wire data_valid_out;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.data_out(data_out), 
		.data_valid_out(data_valid_out), 
		.data_valid(data_valid), 
		.data(data), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		data_valid = 0;
		data = 4'b1011;
		clk = 0;
		#100;
		data_valid = 1;
		data = 4'b1011;
		#10 data_valid =0;
		#100;
		data_valid = 1;
		data = 4'b1111;
		#10 data_valid =0;
		#100;
		data_valid = 1;
		data = 4'b1000;
		#10 data_valid =0;
		#100;		
		data_valid = 1;
		data = 4'b1001;
		#10 data_valid =0;
		#100;	
		data_valid=0;
		data=4'b1100;
	end
     always #5 clk<=~clk; 
endmodule


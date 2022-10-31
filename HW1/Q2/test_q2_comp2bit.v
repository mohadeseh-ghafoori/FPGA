`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:17:44 02/28/2020
// Design Name:   comp2bit
// Module Name:   F:/fpga/q2-hw1/test_q2_comp2bit.v
// Project Name:  q2-hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: comp2bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_q2_comp2bit;

	// Inputs
	reg [0:1] a;
	reg [0:1] b;

	// Outputs
	wire ahigher;
	wire alower;
	wire asame;

	// Instantiate the Unit Under Test (UUT)
	comp2bit uut (
		.ahigher(ahigher), 
		.alower(alower), 
		.asame(asame), 
		.a(a), 
		.b(b)
	);

	initial begin
      {a,b}=4'b1001;
		#50;
	   {a,b}=4'b0111;
		#50;
		{a,b}=4'b1111;
		#50;

	end
      
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:19:14 02/28/2020
// Design Name:   comp4bit
// Module Name:   F:/fpga/q2-hw1/test_q2_comp4bit.v
// Project Name:  q2-hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: comp4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_q2_comp4bit;

	// Inputs
	reg [0:3] a;
	reg [0:3] b;

	// Outputs
	wire ahigher;
	wire alower;
	wire asame;

	// Instantiate the Unit Under Test (UUT)
	comp4bit uut (
		.ahigher(ahigher), 
		.alower(alower), 
		.asame(asame), 
		.a(a), 
		.b(b)
	);

	initial begin
    {a,b}=8'b11000111;
     #50;
	  {a,b}=8'b01110110;
     #50;
	  {a,b}=8'b01111111;
     #50;
	  {a,b}=8'b01100111;
     #50;
	  {a,b}=8'b10101010;
     #50;
	end
      
endmodule


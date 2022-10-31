`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:43:21 02/28/2020
// Design Name:   z
// Module Name:   F:/fpga/q4-hw1/test_q4.v
// Project Name:  q4-hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: z
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_q4;

	// Inputs
	reg a;
	reg b;
	reg c;
	reg d;
	reg e;
	reg f;

	// Outputs
	wire z;

	// Instantiate the Unit Under Test (UUT)
	z uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.e(e), 
		.f(f), 
		.z(z)
	);

	initial begin
	
		{a,b,c,d,e,f}=6'b010101;
		#50;
		{a,b,c,d,e,f}=6'b100101;
		#50;
		{a,b,c,d,e,f}=6'b000101;
		#50;
      {a,b,c,d,e,f}=6'b110101;
		#50;
		{a,b,c,d,e,f}=6'b111111;
		#50;
		{a,b,c,d,e,f}=6'b011101;
		#50;
		{a,b,c,d,e,f}=6'b101101;
		#50;
	
	end
      
endmodule


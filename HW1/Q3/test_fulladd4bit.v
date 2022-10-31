`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:21:26 02/29/2020
// Design Name:   fulladd4bit
// Module Name:   F:/fpga/q3-hw1/test_fulladd4bit.v
// Project Name:  q3-hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fulladd4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fulladd4bit;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	// Outputs
	wire [3:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	fulladd4bit uut (
		.sum(sum), 
		.cout(cout), 
		.a(a), 
		.b(b), 
		.cin(cin)
	);

	initial begin
		// Initialize Inputs
		a = 4'd2;
		b = 4'd5;
		cin = 0;
		#50;
		a = 4'd4;
		b = 4'd10;
		cin = 0;
		#50;	
		a = -4'd4;
		b = 4'd10;
		cin = 0;
		#50;	    		
		a = 4'd4;
		b = 4'd1;
		cin = 0;
		#50;	        
		// Add stimulus here

	end
      
endmodule


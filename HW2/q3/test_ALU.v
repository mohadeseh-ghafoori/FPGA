`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:02:29 03/17/2020
// Design Name:   ALU
// Module Name:   E:/fpga/q3_hw2/test_ALU.v
// Project Name:  q3_hw2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ALU;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg en;
	reg [1:0] sel;

	// Outputs
	wire [6:0] out;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.out(out), 
		.a(a), 
		.b(b), 
		.en(en), 
		.sel(sel)
	);

	initial begin
		// Initialize Inputs
		a = 4;
		b = 3;
		en = 1;
		sel = 0;
		#4;
      $display(" a=%d , b=%d , en=%d , sel=%d ,out=%b",a,b,en,sel,out);
		a = 4;
		b = 6;
		en = 1;
		sel = 0;
		#4;		
       $display(" a=%d , b=%d , en=%d , sel=%d ,out=%b",a,b,en,sel,out);
		a = 10;
		b = 3;
		en = 1;
		sel = 1;
		#4;		
      $display(" a=%d , b=%d , en=%d , sel=%d ,out=%b",a,b,en,sel,out);
		a = 10;
		b = 5;
		en = 1;
		sel = 1;
		#4;		
       $display(" a=%d , b=%d , en=%d , sel=%d ,out=%b",a,b,en,sel,out);
		a = 6;
		b = 1;
		en = 1;
		sel = 2;
		#4;		
       $display(" a=%d , b=%d , en=%d , sel=%d ,out=%b",a,b,en,sel,out);		 
		a = 8;
		b = 4;
		en = 1;
		sel = 2;
		#4;	
       $display(" a=%d , b=%d , en=%d , sel=%d ,out=%b",a,b,en,sel,out);		
		a = 10;
		b = 5;
		en = 0;
		sel = 1;
		#4;		
       
       $display(" a=%d , b=%d , en=%d , sel=%d ,out=%b",a,b,en,sel,out);
		a = 3;
		b = 4;
		en = 1;
		sel = 3;
		#4;	
		
       $display(" a=%d , b=%d , en=%d , sel=%d ,out=%b",a,b,en,sel,out);		 
		a = 2;
		b = 7;
		en = 1;
		sel = 3;
		#4;		
       $display(" a=%d , b=%d , en=%d , sel=%d ,out=%b",a,b,en,sel,out);		 
		a = 9;
		b = -3;
		en = 0;
		sel = 1;
		#4;		
       $display(" a=%d , b=%d , en=%d , sel=%d ,out=%b",a,b,en,sel,out);
	 
		 
		// Add stimulus here

	end
      
endmodule


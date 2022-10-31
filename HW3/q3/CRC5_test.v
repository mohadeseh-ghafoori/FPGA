`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:12:52 04/03/2020
// Design Name:   CRC5
// Module Name:   E:/fpga/USB_CRC/CRC5_test.v
// Project Name:  USB_CRC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CRC5
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CRC5_test;

	// Inputs
	reg  data_in;
	reg clk;
	reg reset;

	// Outputs
	wire [4:0] crc5;

	// Instantiate the Unit Under Test (UUT)
	CRC5 uut (
		.crc5(crc5), 
		.data_in(data_in), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		
		clk = 0;
		reset = 0;
	    data_in=1'b0;
       @(negedge clk) data_in=1'b0;
       @(negedge clk) data_in=1'b0;
       @(negedge clk) data_in=1'b0;	
		 #100;
	
       @(negedge clk) data_in=1'b0;	
       @(negedge clk) data_in=1'b0;	
       @(negedge clk) data_in=1'b1;	
       @(negedge clk) data_in=1'b0;	 
       #100;		 

       @(negedge clk) data_in=1'b0;	
       @(negedge clk) data_in=1'b1;	
       @(negedge clk) data_in=1'b1;	
       @(negedge clk) data_in=1'b1;	
		 #100;
		 reset=1;
		 #50; 
		 reset=0;

       @(negedge clk) data_in=1'b1;	
       @(negedge clk) data_in=1'b0;	
       @(negedge clk) data_in=1'b0;	
       @(negedge clk) data_in=1'b1;	
		 #100;

       @(negedge clk) data_in=1'b1;	
       @(negedge clk) data_in=1'b1;	
       @(negedge clk) data_in=1'b1;	
       @(negedge clk) data_in=1'b1;			 
	end
    always #25 clk<=~clk;  
	
endmodule


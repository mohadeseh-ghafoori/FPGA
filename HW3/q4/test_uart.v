`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:55:51 04/02/2020
// Design Name:   uart
// Module Name:   E:/fpga/UART/test_uart.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: uart
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_uart;

	// Inputs
	reg clk;
	reg Rx;

	// Outputs
	wire data_valid;
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	uart uut (
		.data_valid(data_valid), 
		.data_out(data_out), 
		.clk(clk), 
		.Rx(Rx)
	);

	initial begin
		clk = 0;
		Rx = 0;      //START BIT
		
		
		@(negedge clk) Rx = 1;
		@(negedge clk) Rx = 0;
		@(negedge clk) Rx = 1;
		@(negedge clk) Rx = 0;
		@(negedge clk) Rx = 0;
		@(negedge clk) Rx = 0;
		@(negedge clk) Rx = 1;
		@(negedge clk) Rx = 1;
		
		
		@(negedge clk) Rx = 1;	// STOP BIT
		
		
		@(negedge clk) Rx = 0;   //START BIT
		
		@(negedge clk) Rx = 0;
		@(negedge clk) Rx = 0;
		@(negedge clk) Rx = 1;
		@(negedge clk) Rx = 1;
		@(negedge clk) Rx = 1;
		@(negedge clk) Rx = 0;
		@(negedge clk) Rx = 1;
		@(negedge clk) Rx = 0;
		
		@(negedge clk) Rx = 1;  // STOP BIT
	   end
		
		always #20 clk<=~clk;
      
endmodule


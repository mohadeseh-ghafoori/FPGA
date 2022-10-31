`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:46:58 06/03/2020
// Design Name:   sender
// Module Name:   E:/fpga/serial_with_paritycheck/test.v
// Project Name:  serial_with_paritycheck
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sender
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg [3:0] in;
	reg clk;
	reg TX_send;
   reg RX;
	reg ctrl=0;
	// Outputs
	wire out,busy;
   wire valid_data;
	// Instantiate the Unit Under Test (UUT)
	sender uut (
		.in(in), 
		.clk(clk), 
		.TX_send(TX_send),
      .busy( busy ),		
		.out(out)
	);

	reciever uvt( 
	    .RX(RX),
	    .clk(clk),
	    .valid_data(valid_data)
		 );
	
	assign RX= (ctrl)? ~out : out;
	
	initial begin
		// Initialize Inputs
		in = 0;
		clk = 0;
		TX_send = 0;
      #20;
		@(negedge clk) TX_send = 1;
		in=5;
		@(negedge clk) TX_send = 0;
		#200;
		
		@(negedge clk) TX_send = 1;
		in=15;
		@(negedge clk) TX_send = 0;
		@(negedge clk) ctrl=1;
		@(negedge clk) 
		@(negedge clk) ctrl=0;
		#200;
		
		@(negedge clk) TX_send = 1;
		in=10;
		@(negedge clk) TX_send = 0;
		#200;
		
		@(negedge clk) TX_send = 1;
		in=9;
		@(negedge clk) TX_send = 0;
		@(negedge clk)
		@(negedge clk)
		@(negedge clk) ctrl=1;
		@(negedge clk) ctrl=0;
		#200;

		@(negedge clk) TX_send = 1;
		in=3;
		@(negedge clk) TX_send = 0;
		#200;

		@(negedge clk) TX_send = 1;
		in=12;
		@(negedge clk) TX_send = 0;
		#200;

		@(negedge clk) TX_send = 1;
		in=13;
		@(negedge clk) TX_send = 0;
		@(negedge clk)
		@(negedge clk)
		@(negedge clk)
      @(negedge clk)
      @(negedge clk)
		@(negedge clk) ctrl=1;
		@(negedge clk) ctrl=0;
		#200;

		@(negedge clk) TX_send = 1;
		in=14;
		@(negedge clk) TX_send = 0;
		#200;

		@(negedge clk) TX_send = 1;
		in=8;
		@(negedge clk) TX_send = 0;
		#200;

		@(negedge clk) TX_send = 1;
		in=6;
		@(negedge clk) TX_send = 0;
		@(negedge clk)
      @(negedge clk)
		@(negedge clk) ctrl=1;
		@(negedge clk) ctrl=0;
		@(negedge clk)
		@(negedge clk) ctrl=1;
		@(negedge clk) ctrl=0;
		#200;

		

	end
    always #5 clk<=~clk;  
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:07:24 06/03/2020
// Design Name:   generate_fifo_fsm
// Module Name:   E:/fpga/generating_fifo/test_fifo.v
// Project Name:  generating_fifo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: generate_fifo_fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fifo;

	// Inputs
	reg [7:0] in;
	reg rd;
	reg wr;
	reg reset;
	reg clk;
   reg [10:0] i=0;
	// Outputs
	wire [7:0] out;
	wire [9:0] count;
	wire full;
	wire empty;

	// Instantiate the Unit Under Test (UUT)
	generate_fifo_fsm uut (
		.out(out), 
		.count(count), 
		.full(full), 
		.empty(empty), 
		.in(in), 
		.rd(rd), 
		.wr(wr), 
		.reset(reset), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		rd = 0;
		wr = 0;
		reset = 0;
		clk = 0;
		#20;
		@(negedge clk) wr=1;
      for( i=1; i<1024; i=i+1 ) begin 
          @(negedge clk) in=i;
      end 		
      @(negedge clk) wr=0;
		@(negedge clk) rd=1;
		i=0;
      for( i=1; i<1024; i=i+1 ) begin 
          @(negedge clk) rd=1;
      end 
      @(negedge clk) rd=0;		
	end
     always #5 clk<=~clk; 
endmodule


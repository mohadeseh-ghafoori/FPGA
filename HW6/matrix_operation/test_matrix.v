`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:21:38 07/29/2020
// Design Name:   top
// Module Name:   E:/fpga/matrix_operation/test_matrix.v
// Project Name:  matrix_operation
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

module test_matrix;

	// Inputs
	reg clk;
	reg rx_A;
	reg rx_B;
	reg [2:0] op;
	reg op_start;
	reg write_start;
   reg [9:0] i=0;
	reg [9:0] j=0;
	// Outputs
	wire tx_C;
	wire transmit_output;
	wire locked;
	wire clk_uart;
   wire addr_B;
	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.rx_A(rx_A), 
		.rx_B(rx_B), 
		.tx_C(tx_C), 
		.op(op), 
		.op_start(op_start), 
		.write_start(write_start),
      .locked(locked),
      .clk_uart(clk_uart),	
      .addr_B(addr_B),		
		.transmit_output(transmit_output)
	);
	
	

	initial begin
		// Initialize Inputs
		clk = 0;
		rx_A = 0;
		rx_B = 0;
		op =3'b100;
		op_start = 0;
		write_start = 0;
		
		wait(locked) 
//		for(i=0;i<=1023;i=i+1) begin
//		     if( i==0) begin
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 1;
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 1;
//					@(posedge clk_uart) rx_A = 1;
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 1;
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 1;
//               @(posedge clk_uart) rx_A = 1;					
//			  end
//		     if(((i%33)==0) && i!=0) begin
//			      @(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 1;
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 1;
//					@(posedge clk_uart) rx_A = 1;
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 1;
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 1;
//					@(posedge clk_uart) rx_A = 1;
//			  end
//			  else begin
//			      @(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 0;
//					@(posedge clk_uart) rx_A = 1;
//					@(posedge clk_uart) rx_A = 1;
//			  end
//		end
//		
//		for(j=0;j<=1023;j=j+1) begin
//			      @(posedge clk_uart) rx_B = 0;
//					@(posedge clk_uart) rx_B = 0;
//					@(posedge clk_uart) rx_B = 0;   
//					@(posedge clk_uart) rx_B = 0;
//					@(posedge clk_uart) rx_B = 0;
//					@(posedge clk_uart) rx_B = 0;
//					@(posedge clk_uart) rx_B = 0;
//					@(posedge clk_uart) rx_B = 0;
//					@(posedge clk_uart) rx_B = 0;
//					@(posedge clk_uart) rx_B = 1;	
//               @(posedge clk_uart) rx_B = 1;					
//		end
//		@(posedge clk_uart) write_start = 1;  
//		@(posedge clk_uart) write_start = 0;
//      if(addr_B==1023) begin
      @(negedge clk) op_start=1;
		@(negedge clk) op_start=0;
		//end
        
		// Add stimulus here

	end
	
	always #20.83 clk<=~clk;
      
endmodule


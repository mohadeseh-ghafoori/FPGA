`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:54:15 03/17/2020
// Design Name:   hamming_dist
// Module Name:   E:/fpga/hamming_distance/test_hamming.v
// Project Name:  hamming_distance
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hamming_dist
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_hamming;

	// Inputs
	reg [15:0] data1;
	reg [15:0] data2;
	reg start;

	// Outputs
	wire [4:0] out;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	hamming_dist uut (
		.out(out), 
		.done(done), 
		.data1(data1), 
		.data2(data2), 
		.start(start)
	);

	initial begin
		// Initialize Inputs
		data1 = 16'b1010;
		data2 = 16'b0111111;
		start = 0;
		#50;
		$display("data1=%b , data2=%b , start=%b , out=%d , done=%b",data1,data2,start,out,done);
		data1 = 16'b1010;
		data2 = 16'b0111111;
		start = 1;
		#50;
		$display("data1=%b , data2=%b , start=%b , out=%d , done=%b",data1,data2,start,out,done);

      data1 = 16'b1101000101101010;
		data2 = 16'b0111111111101101;
		start = 0;
		#50;		
		$display("data1=%b , data2=%b , start=%b , out=%d , done=%b",data1,data2,start,out,done);
      data1 = 16'b1101000101101010;
		data2 = 16'b0111111111101101;
		start = 1;
		#50;
		$display("data1=%b , data2=%b , start=%b , out=%d , done=%b",data1,data2,start,out,done);


      data1 = 16'b1101000101101010;
		data2 = 16'b0011101110101101;
		start = 1;
		#50;	
		$display("data1=%b , data2=%b , start=%b , out=%d , done=%b",data1,data2,start,out,done);
      		
       
      data1 = 16'b1101000101101010;
		data2 = 16'b0001101000101000;
		start = 1;
		#50;
		$display("data1=%b , data2=%b , start=%b , out=%d , done=%b",data1,data2,start,out,done);


      data1 = 16'b1001001100101000;
		data2 = 16'b1001001100101000;
		start = 1;
		#50;
      $display("data1=%b , data2=%b , start=%b , out=%d , done=%b",data1,data2,start,out,done);		

      data1 = 16'b1101011100101101;
		data2 = 16'b1001001110101000;
		start = 1;
		#50;	
      $display("data1=%b , data2=%b , start=%b , out=%d , done=%b",data1,data2,start,out,done);
		
      data1 = 16'b1010101010101010;
		data2 = 16'b0101010101010101;
		start = 1;
		#50;
		$display("data1=%b , data2=%b , start=%b , out=%d , done=%b",data1,data2,start,out,done);
		
      data1 = 16'b1010101010101010;
		data2 = 16'b0101000101110101;
		start = 0;
		#50;		
		$display("data1=%b , data2=%b , start=%b , out=%d , done=%b",data1,data2,start,out,done);
		
	end
      
endmodule


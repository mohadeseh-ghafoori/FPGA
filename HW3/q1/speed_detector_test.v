`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:47:56 04/03/2020
// Design Name:   speed_detector
// Module Name:   E:/fpga/motor_speed_detector/speed_detector_test.v
// Project Name:  motor_speed_detector
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: speed_detector
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module speed_detector_test;

	// Inputs
	reg pulse;
	reg clk;
	reg reset;
   reg [8:0] cnt1=0;
	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	speed_detector uut (
		.out(out), 
		.pulse(pulse), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		pulse = 0;
		clk = 0;
		reset = 0;
   for ( cnt1=0;cnt1<399;cnt1=cnt1+1) begin
              if( cnt1 < 66) #15000000 pulse=~pulse ; 
				  if( (cnt1>=66) && (cnt1<199) ) #7500000 pulse=~pulse ;
				  if( cnt1>= 199 ) #5000000 pulse=~pulse ;
	  end 
		
		# 3000000000 reset =1;
        
		

	end
	always #12.5 clk<=~clk;
  
	
	
	
	

      
endmodule


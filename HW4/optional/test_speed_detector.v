`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:46:19 05/03/2020
// Design Name:   asymmetric_detector
// Module Name:   E:/fpga/motor_speed_detector_asymmetric/test_speed_detector.v
// Project Name:  motor_speed_detector_asymmetric
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: asymmetric_detector
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_speed_detector;

	// Inputs
	reg pulse;
	reg clk;
	reg reset;
   reg [4:0] cnt1=0;
	reg [5:0] i=0;
	// Outputs
	wire [7:0] speed;

	// Instantiate the Unit Under Test (UUT)
	asymmetric_detector uut (
		.speed(speed), 
		.pulse(pulse), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		pulse = 0;
		clk = 0;
		reset = 0;
		for ( cnt1=1;cnt1<=25;cnt1=cnt1+1) begin 
		     #5000000   pulse=~pulse;
		     #5000000   pulse=~pulse;
			  #3000000   pulse=~pulse;
			  #7000000   pulse=~pulse;
			  #8000000   pulse=~pulse;
			  #2000000   pulse=~pulse;
			  #1000000   pulse=~pulse;
			  #9000000   pulse=~pulse;
		end
	  for ( i=1; i<=40 ; i=i+1 ) begin
	       #1000000    pulse=~pulse;
			 #4000000    pulse=~pulse;
			 #2000000   pulse=~pulse;
			 #3000000   pulse=~pulse;
			 #4000000   pulse=~pulse;
			 #1000000   pulse=~pulse;
			 #3000000   pulse=~pulse;
			 #2000000   pulse=~pulse;
			 #2500000   pulse=~pulse;
			 #2500000   pulse=~pulse;
	  end
        
		

	end
	always #12.5 clk<=~clk;
      
endmodule


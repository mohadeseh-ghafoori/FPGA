`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:17:55 06/01/2020
// Design Name:   robot
// Module Name:   E:/fpga/factory_robot/test_robot.v
// Project Name:  factory_robot
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: robot
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_robot;

	// Inputs
	reg sensor1;
	reg sensor2;
	reg sensor3;
	reg sensor4;
	reg ready;
	reg clk;

	// Outputs
	wire low_material;
	wire stuck;
	wire over_heat;
	wire on;
	wire warning;

	// Instantiate the Unit Under Test (UUT)
	robot uut (
		.low_material(low_material), 
		.stuck(stuck), 
		.over_heat(over_heat), 
		.on(on), 
		.warning(warning), 
		.sensor1(sensor1), 
		.sensor2(sensor2), 
		.sensor3(sensor3), 
		.sensor4(sensor4), 
		.ready(ready), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		sensor1 = 0;
		sensor2 = 0;
		sensor3 = 0;
		sensor4 = 0;
		ready = 0;
		clk = 0;

      @(negedge clk) sensor1 = 1;
		@(negedge clk) 
      @(negedge clk) sensor1 = 0;
		
      @(negedge clk) sensor2 = 1;
		@(negedge clk) ready=1;
		sensor2=0;
		@(negedge clk) ready=0;
		
      @(negedge clk) sensor4 = 1;
		@(negedge clk) 
      @(negedge clk) sensor4 = 0;
		
		@(negedge clk) sensor3=1;
		repeat ( 40000 ) #3000000 ;
		  
		@(negedge clk) ready=1;
		sensor3=0;
		
		

	end
   always #125 clk<=~clk;  
endmodule


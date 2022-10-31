`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:21:41 06/11/2020 
// Design Name: 
// Module Name:    dcm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clk_gen(
    input clk,
    output reg clk_calc,
    output reg clk_uart,
    output locked
    );
	 
	  wire clk_72,clk_100;
	  reg [9:0] cnt=0;
  my_dcm clk_generator
   (// Clock in ports
    .CLK_IN1(clk),      // IN
    // Clock out ports
    .CLK_OUT1(clk_72),     // OUT
    .CLK_OUT2(clk_100),     // OUT
    // Status and control signals
    .RESET(RESET),// IN
    .LOCKED(LOCKED));      // OUT

     always @(posedge clk_72) begin
	     if(LOCKED) begin
		       clk_calc<=clk_100;
             if ( cnt < 625 ) cnt<=cnt+1;
             else if ( cnt==625 ) begin 
				      cnt<=0;
						clk_uart<=~clk_uart;
				 end
			end
			else begin 
			    cnt<=0;
			    clk_uart<=0;
				 clk_calc<=0;
			end
      end
endmodule

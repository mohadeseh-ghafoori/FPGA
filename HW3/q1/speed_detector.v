`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:37 04/02/2020 
// Design Name: 
// Module Name:    speed_detector 
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
module speed_detector(
    output reg [7:0] out,
    input pulse,
    input clk,
    input reset
    );
	 
	 reg [31:0] cnt=0;
	 reg [31:0] counter=0;
	 always @(posedge clk) begin
	 
	 if ( reset==0) begin
	     if ( pulse==1) begin
	      cnt=cnt+1;
	      counter=cnt;
	     end
	    if(pulse==0) begin
	       cnt=0;
	      if(counter!=0) out=10000000/(counter);
         else out=0;
	    end
	 end
	 
	 if (reset==1) begin
	 out=0;
	 cnt=0;
	 counter=0;
	 end
	 
	 end
	 


endmodule

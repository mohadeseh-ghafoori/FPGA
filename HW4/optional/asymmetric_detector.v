`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:11:42 05/03/2020 
// Design Name: 
// Module Name:    asymmetric_detector 
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
module asymmetric_detector(
    output reg [7:0] speed=0,
    input pulse,
    input clk,
    input reset
    );
    reg copy_pulse=0;
	 reg [32:0] cnt=0;
	 reg [8:0] counter=1;
	 always @(posedge clk) begin
	   if( reset==0) begin
	       copy_pulse<=pulse;
	       cnt<=cnt+1;
		    if ( cnt<40000000 ) begin
		         if( ({pulse,copy_pulse}==2'b01) || ({pulse,copy_pulse}==2'b10) ) counter<=counter+1;
		    end
		    if( cnt==40000000 ) begin 
		         speed<=counter/4;
			      cnt<=0;
			      counter<=1;
		    end
		end
		else begin
		    speed<=0;
		    counter<=0;
		    cnt<=0;
		end
	 end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:42 04/03/2020 
// Design Name: 
// Module Name:    CRC5 
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
module CRC5(
    output reg [4:0] crc5,
    input  data_in,
    input clk,
    input reset
    );
    
	 reg [3:0] cnt=0;
	 reg [4:0] shiftreg=0;
	 always @(posedge clk) begin
	 if ( reset==0) begin
	 cnt<=cnt+1;
	 shiftreg[0]<=(shiftreg[4]^data_in);
	 shiftreg[1]<=shiftreg[0];
	 shiftreg[2]<=(shiftreg[1]^shiftreg[4]^data_in);
	 shiftreg[3]<=shiftreg[2];
	 shiftreg[4]<=shiftreg[3];
    if( cnt==4 ) begin
	 crc5<=shiftreg[4:0] ;
	 cnt<=0;
	 shiftreg<=0;
	 end
	 
	 end

	 
	 if ( reset ==1 ) begin
	 crc5<=0;
	 end
	 
	 
	 end
	

endmodule

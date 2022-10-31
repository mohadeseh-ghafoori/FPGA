`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:56:22 04/02/2020 
// Design Name: 
// Module Name:    detector_overlap 
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
module detector_overlap(
    output reg [3:0] n,
    input [3:0] string1,
    input string2,
    input clk
    );
    reg [3:0] register=0;
	 reg [4:0] cnt=0;
	 reg [3:0] a=0;
    always @(posedge clk) begin
	 cnt<=cnt+1;
	 if( cnt< 20) begin
	 register<={string2,register[3:1]};
	 if( register==string1) a<=a+1;
	 end
	 else begin
	 cnt<=0;
	 n<=a;
	 register<=4'b0000;
	 a<=0;
	 end
	 
	 
	 
	 
	 end
endmodule

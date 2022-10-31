`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:41:46 03/17/2020 
// Design Name: 
// Module Name:    hamming_dist 
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
module hamming_dist(
    output [4:0] out,
    output done,
    input [15:0] data1,
    input [15:0] data2,
    input start
    );
	 wire [15:0] w1;
	 wire [4:0] w2;
	 assign w1=data1^data2;
	 assign w2=w1[0]+w1[1]+w1[2]+w1[3]+w1[4]+w1[5]+w1[6]+w1[7]+w1[8]+w1[9]+w1[10]+w1[11]+w1[12]+w1[13]+w1[14]+w1[15];
    assign out= (start)? w2 :5'b0 ;
	 assign done=start;

endmodule

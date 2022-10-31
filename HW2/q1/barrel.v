`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:48:04 03/18/2020 
// Design Name: 
// Module Name:    barrel 
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
module barrel(
    output [7:0] out,
    input [7:0] in,
    input [2:0] shift_mag,
    input ctrl
    );
    wire [7:0] w1,w2,w3,w4,w5,w6;
	 assign w1=in>>shift_mag;
	 assign w2=in<<(8-shift_mag);
	 assign w3=w1|w2;

	 assign w4=in<<shift_mag;
	 assign w5=in>>(8-shift_mag);
	 assign w6=w4|w5;
	 assign out=(ctrl)? w3:w6;
	 
endmodule

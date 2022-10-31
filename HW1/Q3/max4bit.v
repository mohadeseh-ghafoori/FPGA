`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:38:20 02/29/2020 
// Design Name: 
// Module Name:    max4bit 
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
module max4bit(
    output out,
    input s1,
    input s0,
    input i0,
    input i1,
    input i2,
    input i3
    );
	 wire s1n, s0n; 
	 wire y0, y1, y2, y3;
    not (s1n, s1);
    not (s0n, s0);
    and (y0, i0, s1n, s0n);
    and (y1, i1, s1n, s0); 
    and (y2, i2, s1, s0n); 
    and (y3, i3, s1, s0); 
    or (out, y0, y1, y2, y3);
    

endmodule

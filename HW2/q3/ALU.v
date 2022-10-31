`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:52:11 03/17/2020 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    output [6:0] out,
    input [3:0] a,
    input [3:0] b,
	 input en,
    input [1:0] sel
    );
    wire [3:0] out1;
	 assign out1=({sel[1],sel[0]}==2'b00)?(a>b)? a-b : b-a :
	              ({sel[1],sel[0]}==2'b01)? a+b :
					  ({sel[1],sel[0]}==2'b10) ? a~^b :
					  ~(a&b);
	 sevenseg_decoder m(out,en,out1);	  

endmodule

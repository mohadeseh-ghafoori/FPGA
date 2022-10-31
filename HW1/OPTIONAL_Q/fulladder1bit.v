`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:41:43 02/28/2020 
// Design Name: 
// Module Name:    fulladder1bit 
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
module fulladder1bit(
    output sum,
    output cout,
    input a,
    input b,
    input cin
    );
	  wire w1;
	  wire w2;
	  wire w3;
     xor xor1(sum,a,b,cin);
	  and and1(w1,a,b);
	  xor xor2(w2,a,b);
     and and2(w3,cin,w2);
	  or or1(cout,w1,w3);
		
		
		
endmodule

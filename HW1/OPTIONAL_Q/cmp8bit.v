`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:53:27 02/28/2020 
// Design Name: 
// Module Name:    cmp8bit 
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
module cmp8bit(
    output ahigher,
    output alower,
    output asame,
    input [0:7] a,
    input [0:7] b
    );
	 wire w1;
    wire w2;
	 wire w3;
	 wire w4;
	 wire w5;
	 wire w6;
	 wire w7;
	 cmp4bit msb1(w1,w2,w3,a[0:3],b[0:3]);
	 cmp4bit lsb1(w4,w5,w6,a[4:7],b[4:7]);
	 and and1(w7,w4,w3);
	 or or1(ahigher,w1,w7);
	 
	 wire w8;
    wire w9;
	 wire w10;
	 wire w11;
	 wire w12;
	 wire w13;
	 wire w14;
	 cmp4bit msb2(w8,w9,w10,a[0:3],b[0:3]);
	 cmp4bit lsb2(w11,w12,w13,a[4:7],b[4:7]);
	 and and2(w14,w10,w12);	
    or or2(alower,w14,w9); 
     
    wire w15;
    wire w16;
	 wire w17;
	 wire w18;
	 wire w19;
	 wire w20;	  
	 cmp4bit msb3(w15,w16,w17,a[0:3],b[0:3]);
	 cmp4bit lsb3(w18,w19,w20,a[4:7],b[4:7]);
	 and and3(asame,w17,w20);	


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:33:17 02/29/2020 
// Design Name: 
// Module Name:    calculatig_block 
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
module calculatig_block(
    output[0:3] out,
    input [0:3] a,
    input [0:3] b,
    input s0,
    input s1
    );
	 wire [0:3] w1,w2,w3,w;
	 wire cout,cout1;
    reg [0:3] inst1=4'd1;
	 reg [0:3] inst2=-4'd1;
//    reg inst3=1'd1;
	 reg cin=1'b0;
	 reg [0:3] d=4'b0;
//    nor nor1[0:3](w2,~b,inst1);
//	 nor nor2(w2[1],b[1],inst3);
//	 nor nor3(w2[2],b[2],inst3);
//	 nor nor4(w2[3],b[3],inst3);
	 
     nor nor2[0:3](w,b,d);
	  fulladd4bit f0(w3[0:3],cout1,w[0:3],inst1[0:3],cin);


	 max4bit m1(w1[0],s1,s0,b[0],w3[0],inst1[0],inst2[0]);
    max4bit m2(w1[1],s1,s0,b[1],w3[1],inst1[1],inst2[1]);
	 max4bit m3(w1[2],s1,s0,b[2],w3[2],inst1[2],inst2[2]);
	 max4bit m4(w1[3],s1,s0,b[3],w3[3],inst1[3],inst2[3]);
	 fulladd4bit f(out[0:3],cout,a[0:3],w1[0:3],cin);
	 
endmodule
